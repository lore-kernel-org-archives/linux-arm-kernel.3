Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5D3C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47UBI/niL6S9mV0mk4dleceEw56xBW1KNX8OcFOEg40=; b=sRElvxg2963ChZsPSQr4Scjn0b
	Z6uLL5QYOndvcuv4gvsVKgkq6VXIkAIXBhKPRs/NAN90C7IL0YrXHfTL6he6UVbQnhSeiZPT0n3Jv
	E1pATrh3BIvJx5fnLmCdjirVdYVsvBbia+1GyKfz6qgVS7HNXW6bjzTxZ8CEWD8kQoifprxL1KAQL
	S/0o8xsEokHAf4UCq8KYGE/GSwZzRYAKlml8DU4Xd4UdgquQgNw6G2vcEheRhxZjg6P9LsFxRcbmF
	GJFSkXRxtr6auM0wXqV6f4hVLbxuZqWl0fkf+sEJ3U/ID8plRT0iOj1OGSqXbkiAVh4okwWmwsJ+O
	6qxJ0oVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YNv-0000000DXD3-1Fsi;
	Thu, 10 Sep 2026 06:35:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YNu-0000000DXCI-1C4o
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 06:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=47UBI/niL6S9mV0mk4dleceEw56xBW1KNX8OcFOEg40=; b=Jgm9vYHSLzhOlWgK/DSVuUM+2o
	vBd2u0wBDs72Enx10PznIUpNED+LK6FeD3b9STuP8q8bXr9t4OGJRNTjXfVEydIcQK9yBB5kGeCWd
	TkzpbIUiPKOXSOBF+wwqrsISR+5hKjsO2Gyq22G5uPQr8SKKUTTdE7OCvX9BF2jYgOe/3V81+2iJm
	7m2LtFgGofx30LKQKvuO9h2yG0fwrB3nd95itOvvEbvrnBBVF7rrqJOdvB0PpM18webg+hSsF1key
	w2YSdb7nxWsdZ2oZng0/3BPZdcyNBQ8X3lKqbiwu1MmnjOgKAT1wrqw8kqoIOXFcEmTy50FcGa87U
	p5aAmqsw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4YNr-000000025HM-0fyV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:35:45 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso4804338f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022141; x=1789626941; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47UBI/niL6S9mV0mk4dleceEw56xBW1KNX8OcFOEg40=;
        b=OWZaRiLvQs6AI2TVls6MT9d12n0cc35R5ih3vFSJ6dZ+Dubl74K+YrS4ee99uKnPMn
         Cvw89oCTTB9tX00Jn5MtFHcjgS8mH0ORQRABmweVm0H8hC9ndYQ+U8teKsBho6MZd3fW
         upAQ6SkJ8C3XZ2nIHiv4wI2/E6jQJjBNkjCSLwfzrhRWA2NbSv/wK0nR/I1ggqDnr+ex
         WBQi9QBMgE1ixq866yOT3UA3Swo+1eUz5fsDyIje+LQdk9vUfrkyhzKldh7o9FsdvT32
         F1AG7RoED9NIbArmdqSOT9RxyyAd25//n0oeSpFR+XioXejPmf1VhZhN/KNT47+iWDVO
         tnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022141; x=1789626941;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47UBI/niL6S9mV0mk4dleceEw56xBW1KNX8OcFOEg40=;
        b=ndnIfafl8DkNBrCI9VE7o/szj5HdSGJBeQj6Ne6IbY5STq1heUZUmkwWY1oVRccCpC
         1eFADpBraAy3T0/U2yyRXMNNc+6dz3EE/u0dkvyjPc7zaEHc1L1FGArUVPhppU7ME1uf
         FrrEQvE4tKScgbPNeWiChot7HIKrmWyfangA84Ao/wwVUb40apyn3P2vtIKgkWYqts1L
         m3jig/11WKj2H3WvfiWQ6jQdBcd5fAbeJHU4JjhjYXPFBQfhKjJmUEVkpmf/IryIHbLV
         nZ9uOUQ9ZyQ1696xfjRyFq3iA8FAkLExH5RR9ZMiH1IvhU4HVv9K0bOtkHM2+n1aOGEQ
         FT9w==
X-Forwarded-Encrypted: i=1; AKwUvBwDkXpN2NNOIvgOAGK3+VU9tiekrIwACii/BJcEfVnR6a1AguUa9K5gVXqnKC03L3ZNY3yVsMp6zOXhPGht4lq6@lists.infradead.org
X-Gm-Message-State: AFuF++ndBlisTHDFYxgZ0kXQvW0GLbCovOjFTCvCSCuIYXHb7+xL2RyC
	EhOtypNnTGP8QcrYwpqXYNSXrb39ZIpVNoSgqMRVOCsR3zlkGfyDapO/
X-Gm-Gg: AYBFou3zaU0LIduSeEcX97UIVr3o4CBs18jvypjMfgdzHaNn26gnO5PiKzjBRRmQsln
	jkhfVlkXVBhgMa1lViPbRWnZiOPb68vNduZ6XKHibVMB9mzx/aGTT4y8NVIlmyN4K+lVt2KvKUi
	Jj7Xzon4CLSmQuOePrH1vyk8CuTzdlCsgHOMCzHLkcAtC/tiR5mfklNbEL/sac1EFB7M6WHDnlR
	FW883eb29KTo6WFTJ4e+386pTH5bPjenX6ZpYtNMUc8Y6R73ZMa8gj+h+kWR+0Ph1k9IWoN71MX
	8GC1koNNKb+KumlcrgziVqwGQQkH4diBtmuT0sEOKQeDGWlK0w5ea0LJWXrH0evbpF1OPRt2sOb
	OyRrB7XVk/ebltXyfaFv/zektkriENnUD1CRl0RJKm2dj5XRW5SkvKeHevssOY0arnSY8b2bRNr
	GhB3+vKu1jsAds7qvDnKqNi8v+obuHFy8XhLlbDveDeg29yXO4bF55QLJRKu1Vj5dLl171nqTyJ
	+ajvv8vydCCWVWy37XeOlkVR4aXqmFtap87CBd7E/kKImJnWHoz78k=
X-Received: by 2002:a05:600c:81c8:b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49d1f109802mr89066405e9.7.1789022141345;
        Wed, 09 Sep 2026 23:35:41 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm241531985e9.4.2026.09.09.23.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:35:40 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: jonathan.cameron@oss.qualcomm.com
Cc: sibi.sankar@oss.qualcomm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 10 Sep 2026 08:35:30 +0200
Message-ID: <178902213027.4725.14870667006708702053@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909152014.000055d8@oss.qualcomm.com>
References: <20260909152014.000055d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_073543_339839_2C769CD0 
X-CRM114-Status: GOOD (  11.95  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 9 Sep 2026 15:20:14 -0700
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> wrote:

> > Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>  
> You don't add that for a review comment unless it results in a whole new patch.

Understood, and sorry for the misattribution - dropped in v3, which is
otherwise identical to v2:

  https://lore.kernel.org/all/20260910063440.4677-1-okerixx@gmail.com/

> +CC Sibi who is a whole lot more familiar with Glymur than I am!

Thanks. For the record, the numbers in the cover letter were measured on
a Lenovo Yoga Slim 7x Gen 11 (Glymur, 4032000 kHz sustained / 4723200 kHz
boost); I am happy to rerun anything Sibi would like to see.

Thanks,
Oleg

