Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBE9C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ozhv3Vnu4lRs9Pkbjl4o5rRMNwS9TWIXe5qbazgH48Y=; b=1OsVQ61lJn4DOaHP6+wYXYXsuS
	GU3FLfTmra8uGP6noJCjo8lEiHll+09AIPYyDP1kKt333YWeTHoIbsj26mJ3zfhoqG5C6px16fheg
	QgX3DHo5Etn8dry3z6df6WyNijosIDzPqcoTTVwRppK6xYDbVa4wOLOuKtIHl1a08l9tUJGxWqhXy
	zoTEGutmGysPNuYb0Ij06j5Ly59C6jvNgua2Jz2doWBqlAl2cM6CZwsvqlnzBHNfjg9Mn5jSOuZUX
	rqTk/qNxVOd+3swN911K0Tqm07GQvaWVqpo3ag651MLEnZqSP1FafKmv1g0mNB0YBNt87DqLMk+x/
	dWLV/9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcB8-00000001dll-1PiN;
	Mon, 10 Feb 2025 22:22:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc2z-00000001cEo-39Xz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 22:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ozhv3Vnu4lRs9Pkbjl4o5rRMNwS9TWIXe5qbazgH48Y=; b=NQQbSo5JcWTaGu4dqCyUb+KRo1
	H+ec0dDXpRfeo0HZgLtwFRpBgnmrlq2Dwev9ep8MQJVLzYLeVmUrKLpTLsWx+J+XV3G1O3TYcMgTI
	f5Sf8rd64MizLeQCuyU+aDx//1Gp2SwY35naG0xDmZ5ICKkFmJ7iOx/gbq6TyJfXw7L5atxPRlcQr
	qNNhg8gwjMFTFN5HAnJGJMoMYIECZJ/+W9qCYrOtmYTm+ZR5mJxoYMSOjY8gT1nyr9r/0lMGEg4a0
	rpWsrSEeGFpus9DhBWXQjHyxlPtfAcA3yhzdezu5dkMBUjI02gyGGjvWjtnoGABYToxlv6NinpBZ7
	vHNFdMig==;
Received: from mail-wm1-x362.google.com ([2a00:1450:4864:20::362])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc2v-00000000JR4-3tMZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:14:32 +0000
Received: by mail-wm1-x362.google.com with SMTP id 5b1f17b1804b1-4394036c0efso10904295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 14:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=patrick-wildt-de.20230601.gappssmtp.com; s=20230601; t=1739225666; x=1739830466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ozhv3Vnu4lRs9Pkbjl4o5rRMNwS9TWIXe5qbazgH48Y=;
        b=OK1pBOpFbu30VUjjsE3rY9yrXHx2UDdyFBCRM/rblV/AUOtbp9ibJewfcE2SB6U3Eu
         5z7IE007kMRza91eyLuMvCM/+BbZqXknR2Y3fGtRMYRlzwSuRfqlVeGIjKNIuJpE0k9S
         na6wSEguOze4R6KImLcTCbvK9ScFTi6wTUErXFSIPnoW9vS7fx74oUDAtm8oPvmxF2wd
         cg2/opDYg/o46W8A/Ha9WP3e2AqaNfws2qAnPbQlxGMJEitn/wBTJTGA26e6z7b4xARO
         8lioH/4fuGAiG2qaDWNv4WA57SAUmkgVA1256nAKZcbnnxSoEZRhLtDoYxcKEf0oBZez
         4Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225666; x=1739830466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ozhv3Vnu4lRs9Pkbjl4o5rRMNwS9TWIXe5qbazgH48Y=;
        b=FICKx83/RgUGQBj0gZT0W9Cu1drXsh0XvgkK+eZUzOxe/G0Mi1p9SCAL2WZRSIjvwl
         M15O312tEZYO+CkroiBGHXdpiUGDWR9NdIg5RG1PC4VuHaeT7niqwSpRr4xXU9kJO4Hr
         CkhcmARoBwi6Tc+EpPJdE/8WFwhtsRdqj+j8RGZPiVZBPwLCvYrutPqfj58OlYdYbyuP
         kK/voBatchL7TJbzIWrVRF6K27js1zjn7iBjGG5R60uiC7n4hm5jFlSmTVyYqex+2L/Y
         rlsZXqwxNr8+Spe7adRwDx2MYKrUzIFI3lLdNpHyaTwZc+AcUqnhWWnupyW9TH3PAkq6
         l5dw==
X-Forwarded-Encrypted: i=1; AJvYcCUPsKb83rRYSu0zGw7M4apOEe3eiZECCO0xZ8mzjAM7OcGakwPCWRp4ujKk1qsql9TQbfp563YYxQ+K377xZFvQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/x3BiySBYIv+gNkP9jW//Pu6IwT7hd+lgoiUi6/RcsY/5s0dK
	vdK0KTuilF99ITwiOHIdns6WBwN08DeC/Af7FEXFbDmvvXeItplfzKpLiIVNV94nFvzH5Xyj1hN
	wy+62wKsYAevRCQGQ3sTroZeV2KsTG27t
X-Gm-Gg: ASbGncu5Hvj76kQ7lLJPbRksTDGl13opgWKtS+jJOOffkKRcDHAH9oZd5sVkfL56uwB
	qamf03dT/KjSx0C6eMCprB7nwuFOyZ0RYEc1su1WMQwOA7eYLUGYlUjlfi8ayUOUsKho6M0tkCB
	UxKK6CtNg7FS9xoufTgAybeE651gxm5/5B68qfrmKejBN0Hzgv5J2TxtIB4YEx+h++uru0hZnjh
	+qHyGlN+zqg0CP305C+w3On03BxQ5wA1o1ajDTuEq8pKyHmtzd8beDOWDWYUtnSAHimMWUZjg2m
	D1vroyf3wbTGVLvborxZIaJbKt9LqKYd
X-Google-Smtp-Source: AGHT+IEtVEvJBTL7NTyIlWVziNX5ymcX1eXzKuEmInRMi/mZ4WjeAQ95vMBKEwBIFHdMmikZVxvQOGgC0ZpM
X-Received: by 2002:a05:600c:8706:b0:439:350a:ab52 with SMTP id 5b1f17b1804b1-439350aacbemr93761305e9.30.1739225666202;
        Mon, 10 Feb 2025 14:14:26 -0800 (PST)
Received: from windev.fritz.box (pc19f8e2d.dip0.t-ipconnect.de. [193.159.142.45])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4391dfd4ef0sm9443255e9.37.2025.02.10.14.14.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Feb 2025 14:14:26 -0800 (PST)
X-Relaying-Domain: blueri.se
Date: Mon, 10 Feb 2025 23:14:23 +0100
From: Patrick Wildt <patrick@blueri.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add MNT Reform 2
Message-ID: <Z6p6Pw34JsEa06Gc@windev.fritz.box>
References: <Z5toOecuMiBXM6aF@windev.fritz.box>
 <Z5tobRnjXmr4dl7j@windev.fritz.box>
 <cd6edfed-08a8-44de-9bfb-5199fd2813fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd6edfed-08a8-44de-9bfb-5199fd2813fd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_221430_349746_88BFBD9A 
X-CRM114-Status: GOOD (  14.32  )
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

On Thu, Jan 30, 2025 at 01:05:45PM +0100, Krzysztof Kozlowski wrote:
> On 30/01/2025 12:54, Patrick Wildt wrote:
> > +		rk806_dvs1_slp: rk806_dvs1_slp {
> 
> No underscores in node names. Missing suffix also suggests this fails
> tests, so standard disclaimer:
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.

Hi Krzysztof,

You were right, I did not know about that; thanks for bringing that to
my attention!  I've prepared a v2 that I'll send out now which does seem
to be happy with the schema, and hope fix those issues plus a few more.

Please let me know if there's anything else that I might have missed.

Thanks,
Patrick

