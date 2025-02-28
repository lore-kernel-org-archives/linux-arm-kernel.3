Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BC7C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=piWw5v3AaWNogURCLiAS+q/F5j4MCGQiW3lOFbefjZA=; b=Q8vAQEhy+CmwLuME7Te+Rw7mFX
	OhkiM1BOCo9OGWNa63Q0Zdo8WS1o66KMFkNiHZhB1nZfrRMvGAjsFgHQ/bslPGiE2EG/oy8ZNzJgD
	cjN5nX6sEWlHJys57y5sdm0NRW1JpyH4ADtK8A3wWK+m16GvyuXc55RiuQiReXT2r/xdjaa3THhO5
	oQ1nF/hrGvqpcNWt6gHa+cK7M6WZUR0V164I9qfvgzA3Hhw6K7qESc7OWdifGfO/MCIV/Hp0XyU26
	9px1oevQNkQGZRuNdyimMCPOb3i+sUpBSvMiNnkm03WzjMdhHewCCyg29fA/jbPAXQEJneX9Kn+R1
	vNawKL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2RF-0000000BUu8-0ysL;
	Fri, 28 Feb 2025 15:38:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to28u-0000000BRC9-3iCG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740755951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=piWw5v3AaWNogURCLiAS+q/F5j4MCGQiW3lOFbefjZA=;
	b=cVRIKjBdjd9UPD+XTxP7ykQNzRJ0HOUCZIUQDm1oWs6pFM4UQ1VBsWe6/MhFERvaOJ586j
	CEVtnn0nWyKtbJaczrKZXE1bMRP+Ajs5Cwy6NdaVAMvK/Eipum+KnJqeVZWLipZHcmZNp0
	6UKfX0cELoNJGO3ggLPitQiQpY7uaAo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-VaWHVdM-M-ey2nCUFsxCfw-1; Fri, 28 Feb 2025 10:19:09 -0500
X-MC-Unique: VaWHVdM-M-ey2nCUFsxCfw-1
X-Mimecast-MFC-AGG-ID: VaWHVdM-M-ey2nCUFsxCfw_1740755948
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4394c747c72so9745685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 07:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755948; x=1741360748;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piWw5v3AaWNogURCLiAS+q/F5j4MCGQiW3lOFbefjZA=;
        b=Kx5NalIVpWDU95UufNkoBMzsEpgez9hVkD31V9Gs8utLh200Qu7l+1QEnSGhdNCguJ
         XqWOmjxchpTtnszxpI7rVjiVySgrGvucKJpspKN6Gb93sisU6aNfmcQPOvmGNJn/0I3U
         oso1eIO5GW58tfyIQ5wofddRtLfTlSmHNI+nJncxhXLsWvtZAiD58GMqmrtzhqX7zJ0t
         WDW0mDT6v5MsIRn0hnW3Y+/8K4tMDT/vD121tvwJCGngEqfI1OKea1UAMkM5ShvEE0j5
         jG6ZitN0P057qyaQ8Ki/78dAI9MuYX6+E1rCu95xPXHC6VRWVKihCEtvFQyJ7PlVSqle
         6QMA==
X-Gm-Message-State: AOJu0YwvCv97cQfuHQ0JiRPGXdMGpB3OHNYhe5s7NHgZNldE6K4KQ9IM
	/SurvJgRN9i2UTa75c6hKvAYMFryghOsmGY7c2Usdpg8swNkYWwnr3KlkspjicZgSEMnO0gseJw
	TqsFyFe/Em4wAOpE/XuiNY17cIArDy3nPe2NmHyukSWbzIIRsMHO9bSx04rDABqYwqBF6aFxo
X-Gm-Gg: ASbGncuaw/zrT6XcctSUzi2l//LBKba2UoOH93uk/n6SEO4l3Q4kdpl20vyA1YWkOVI
	ma885CyVJFxckadhLcXEVbJXnL9MwW86oESKQA6aYvSzOnwWxnut0EPvdLW2zp0Jgw4H0Bh2MLZ
	KPhu7MW9mE7KZhFm8wZqj1Sano7MLlqBev+VFi0PnReDwQA+CFMJTKyQP88mNRL0CAm4i+1UM9V
	z+qjd2coqN29sauF6AdMX0rw81rr17MmhNWGKwC2/HnKXprN5bpubWHPqlbm5Sf5AoKhXBypNai
	5tbNGJQm7ZGA/hnU9gNOkD8Tnq3NcaVln5eZ7bhMWRIOs8s/EbdL+uG2maGlAD48
X-Received: by 2002:a05:600c:4f0d:b0:439:9828:c450 with SMTP id 5b1f17b1804b1-43ba67082e6mr34408545e9.15.1740755948402;
        Fri, 28 Feb 2025 07:19:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVTpPHGtA0mtehU2TvN+X7gr4+lgQoePfplNU1Dml4WC28r5A+HiIriCNJoA58q+KCQMkWgQ==
X-Received: by 2002:a05:600c:4f0d:b0:439:9828:c450 with SMTP id 5b1f17b1804b1-43ba67082e6mr34408195e9.15.1740755948087;
        Fri, 28 Feb 2025 07:19:08 -0800 (PST)
Received: from rh (p200300f6af284000f9ca1328aeaacdd4.dip0.t-ipconnect.de. [2003:f6:af28:4000:f9ca:1328:aeaa:cdd4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52bbb0sm91451245e9.5.2025.02.28.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:19:07 -0800 (PST)
Date: Fri, 28 Feb 2025 16:19:06 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: writable ID_AA64MMFR0_EL1.TGRAN*_2 ?
Message-ID: <597411b1-ff60-edc3-d6f2-1b21ce2e34e9@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1Zx9IH4Wnf33ecbLHuzmQsH7EvJOM2K-uQqFB85Gfe8_1740755948
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_071912_991243_CA36D160 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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

Hi,

I'm looking into the possibility of migrating between 2 (Graviton) hosts
and the only ID register diffs that are not yet writable are TGRAN*_2.
Both hosts support the same sizes for S2 but express that differently
(2==supported vs 0=="look at TGRAN*").

One idea would be to either set the guest view for these to NI (for the
"normal" / not nested guest) or allow to convert between the 2 values
(and maybe also allow to write NI for good measure).

What do you think?

Sebastian


