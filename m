Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912B0CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcN83KsnuXOBiT0bfhcJ41Oft2jKBo42H4ejVB4MEDk=; b=nJuBqVtlnAHAS+KR2pRL13C8p7
	Vf+auGDjqegbaVj0OAGfV1MREtvQ/z487Yi/p9FG20pvTuOvBlorWn24xPOQZhEGOaWAvJO/GoHC8
	JhUb3w1qLnhMVfjEutFjAsMtMw3jXEgxNOWB30dZLvkQ0kXjd2qOgcmzAZHhOZ/+nU0QtBRf0/IBH
	XE0rIUNO7G3f14msBHTyf30uOpCvBH3gSWHFneGrYIvGbP3NyNG+/dOsyfJKZBXqNEA7oRjyFeh+m
	AhIAG+JEVVCM4iBolHDBHYqI+S259eLVyKp04kJ/WUiw/5JeYv6cvFPReZuMhWMqWetSh2aeOogAG
	CXT0il1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvap-00000002j6r-127C;
	Tue, 26 May 2026 17:29:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRval-00000002j5x-3p3W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779816563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zcN83KsnuXOBiT0bfhcJ41Oft2jKBo42H4ejVB4MEDk=;
	b=GOEgraBuPzyuEN4IF72Y26LOY02rXHV1Tyg0w8ANvOAaZKqOoEKHPXCCXOLMbo2KoenuKs
	hmwmf6fQOKjOqUPNfAz7cpk2vTPNSjLDbdFnIoOB9kCLBOJh5aUCVtyQgXrCEbU8TmAdk4
	z7vkzqs35eOr+nqaOeuF29IHbYZvNH4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-9Q2LjIESPsKLxsreHT4gTw-1; Tue, 26 May 2026 13:29:21 -0400
X-MC-Unique: 9Q2LjIESPsKLxsreHT4gTw-1
X-Mimecast-MFC-AGG-ID: 9Q2LjIESPsKLxsreHT4gTw_1779816561
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516dd6e4ed4so88449401cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816561; x=1780421361;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcN83KsnuXOBiT0bfhcJ41Oft2jKBo42H4ejVB4MEDk=;
        b=ZhmzZOGqulJEgU+H18RE6mNpcNDug7VDMAgd0SJquJVT+wEysm6g59femlFn3zimhT
         wd9us0ZcfgrCenc0JitV6SJ9KSPY7L5F5mE+rIcH7FhLyfS1ouTtugQuyeoAafmFmuy3
         48BD6T79Sa9ptdQmyuw4z/POc5vpxVX3hjzrvotwzAgIfcaomLCDIaRtr9hYl0rKYQiH
         ILta5P+ulOQF9cUr/ch+sUs2dZLO3JHeQTQTROV6s7Cx/X+4kB2fkYas8UU4e1LTGoe8
         RHTm1YuDkIu5O3btgNqrSaUKYBWxBJ6mJgwdkUPud2b3grf2DYK/ukvFxmerULNbWA6L
         84CA==
X-Forwarded-Encrypted: i=1; AFNElJ/8NdwWHu7cHmyzY4DL0EAYbvCHEyUhu/w/0XGaoF88OpO5+D++D9WQssUkTHVQJH5lzZNB59ctq6f5hTfH5Unj@lists.infradead.org
X-Gm-Message-State: AOJu0YyL9OseiLvoXjLRDsSfC0EKyC+hAu9XIoGMTAnrr1cFlX/0hOQ2
	eNvp8ZraFuBHG4/8SRe7KT1vn51AW0LPZAiMCwbKFGo81bR44THwo5tUyofrvBvLwWcRB1FYkjb
	SBe+yoE14uZCjLetDsmNl8g4r+06rLmkO2AGHROwzuKnseHfziWHtYXIqKrqA+33uz1XuLimg3G
	pF
X-Gm-Gg: Acq92OFXgEDsJoAmLgrEMto3Qshw1kpYh7rOcjCjzWMDBKZYS9BerKfSdES6ytUGnhs
	Xn0hrxM3wmlKxULf88Fm1g7hlHeaBdx7cLZOqVCDwUxCk/k1qWQViVs5ilVccltHWTgVxA4t2U+
	eBY/eQRAg3AuJeGpsr+q0fDNq7LfwPmYILRCs/KZ0IOsOvgkKFz7vIznju/FYC6/QcYAYTwQ2nS
	Ek7NvaeIX8Bu4vFmcmB0e+qQqjV1eUJxXrgUvdxoNTZGI+04pRuGIcJqRtgnrXXVBVJ8poyCOxW
	e0W2H7rRyFQg7MA8FSIQauD0SJ5bp1mSbXhGU3tvjv/GTgQbCxgUe7EFdZtNnqHcqtwxRFyYHfl
	dP1vr5vgtr/KNxWr7RXim+ifnnZyM90k3ekxckHEyJZtPROh+DG5ZQpKg
X-Received: by 2002:a05:622a:5917:b0:516:f4ef:5c1 with SMTP id d75a77b69052e-516f4ef0d14mr130311261cf.38.1779816561218;
        Tue, 26 May 2026 10:29:21 -0700 (PDT)
X-Received: by 2002:a05:622a:5917:b0:516:f4ef:5c1 with SMTP id d75a77b69052e-516f4ef0d14mr130310671cf.38.1779816560629;
        Tue, 26 May 2026 10:29:20 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51706b08199sm23907171cf.29.2026.05.26.10.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:29:20 -0700 (PDT)
Date: Tue, 26 May 2026 13:29:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: samsung: exynos5410: fix refcount leak
Message-ID: <ahXYbqA40wqxk0QT@redhat.com>
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
In-Reply-To: <20260526061321.6123-1-grandmaster@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pjfgL2DahGk0gMSfpHRX68dHJvYXV7dCRsysSEv0Jrk_1779816561
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_102924_016759_86E1F96C 
X-CRM114-Status: GOOD (  11.10  )
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

On Tue, May 26, 2026 at 08:13:12AM +0200, Alexander A. Klimov wrote:
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
> 
> Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Brian Masney <bmasney@redhat.com>


