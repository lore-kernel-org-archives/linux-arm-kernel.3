Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E966E7AD62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 17:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wG4I6VxM3eFd1aSSwTbKPww5ITUYVRbPhiSShA5xEIY=; b=jYXHbbqO8UNzzr0SN2VvtkCBgo
	lKSeMQD7xlCgadDOkOQ9U9wbQ9OECyzpF+NT8V7ZKxEzI1qF0FVRUcL1XL2c+CIDz9+R/aTfdUrWD
	pjdFi16HeVtzrPnoL7P9TyhRbxA7t7EdKif0lm/sm5msKcSle49nl4VGbk0Pns5biguJRc0SFm6yR
	nCngSKaOmpO170fhiPReEp0HIIYwf0QIZbzQx8X111IjDpWnwwELSglixlGJ4KdwZt6cZGNynR75t
	xDGxoO1sqCDHduCb+MGg1ARBHCfSS5hnUYCtBdYdVernGGKV3TXiuPPGc0doo6sfDvBIDBzILqsum
	cFEScnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYpR4-00000000aTZ-3eUk;
	Thu, 25 Dec 2025 17:47:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYpR0-00000000aSw-3nZS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 17:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766684854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wG4I6VxM3eFd1aSSwTbKPww5ITUYVRbPhiSShA5xEIY=;
	b=AaaNbD5b2kpYtwLLONix60GhSuTx9whWkHYsVAHj4yJHntApN2UrmVe9SWIwKsEVejKfMU
	yMJnVp1AxMDwLGaLN8ONh3L20S4Ls1jk448CRnHcXT6HXlASMy7qeel/TeajJgqNt+4hUs
	ihDYMyjdM7BfVfTAZTChmqM9F0eQgAE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-Bx-E9ybQNsyxSe9hXaFLiw-1; Thu, 25 Dec 2025 12:47:32 -0500
X-MC-Unique: Bx-E9ybQNsyxSe9hXaFLiw-1
X-Mimecast-MFC-AGG-ID: Bx-E9ybQNsyxSe9hXaFLiw_1766684852
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d60f037bso154577741cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766684852; x=1767289652;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wG4I6VxM3eFd1aSSwTbKPww5ITUYVRbPhiSShA5xEIY=;
        b=d12nU5j5cU3IygiCkV256HKg+651svMduFLTPNyJsdt/aC5qqaQ549ObNyCJYfbZBe
         obVn7JLL0S5VXLyRAWUeQFOdTQsRXACkiNRyqailmObyf6f0zsBF6HCB4xbe1HpT6OMY
         B6s54zz5EcTTm5e2yobxk7Rrj9W8U5taYWFCuZyojo2I0vD5Yfq4s8nA6+zlG31ghuKk
         LJHKndypPCpeah1k+bCaekQoNxUV/2NEV1MyMW57fCaVd5B6/LQgr3sPb3hGeE0IkVBt
         FiyqSK3X+R4Ax7jtlh6O3EXRPlZQICIgVVbAMkpvdsNrNW3sPRYGs8LosGlr9p5UOHNN
         lzSg==
X-Forwarded-Encrypted: i=1; AJvYcCXxk0Nu42cnFygXlGs4YC5Jz7QRGFVDnAYtqFAOeFXoCBnAO0pLPBk/oJUKs/6fE5C+2cff+AsubkhbDig+ri/n@lists.infradead.org
X-Gm-Message-State: AOJu0YxDLHoOh9+ItYWmb9tTiDcapwNOCtMzm1WmSoXZrILeoLL3Uywo
	hEQnjHHZyE6Y85TpW5/jq5YzYsoEhgv7Ut6pfQRMkFxkI9+Gd3rtksiXSoV1juLVxDCWJGm5Pig
	GkK2Nu4HP/J2Eqf1mh43tHalITpjZGIqh37nfUnssd6qOJabsAwySfmLlA/ugzLaK+Oia9ZNdqU
	K+
X-Gm-Gg: AY/fxX7dCT1ljYz7drfEi3+rckA6BNN5GknzTpkoZdN7T1xDP/Huz+rko2/CqXo/7JL
	bdxwbnhqwnn0eHOutE5ZjVM2lUeatVYK18NmOsSr7V8rkOr/UKsMdg8QzhQKUhr/84P+W6Dmf26
	gmrSrikOwvfYNqmXba7q8lbCUZGu1VQTQsV+eNFhxqMVaHE8LqXZBejtSLu6bJRjbu+xWqAhluf
	IVZmD8Vd1CbbAPj38epA0ikv6QTqVatFDw2IVXMu3LDlJkkBzXGkhgS9mOV/1yM6JE2laNnJK6g
	i9kODH/FVZFq6xzxaZUAAml9M0b+MNm+aiPRMAZbbOMkurSRAj7eS2EoIHPesQNzW973aobKSgO
	/0QgaZPJrA5v1Goj3wIA29CsIFIRVe8PwuvTyLSBbhQrF
X-Received: by 2002:a05:622a:115:b0:4f1:acd4:6846 with SMTP id d75a77b69052e-4f4abd9819dmr295761161cf.50.1766684851965;
        Thu, 25 Dec 2025 09:47:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcXKCygnM4kDt881UZTTXHcdEXXO2Rd0nQZmfuJ4gtrB34tIkzBXQRGXaaucUOf12IVpIiBQ==
X-Received: by 2002:a05:622a:115:b0:4f1:acd4:6846 with SMTP id d75a77b69052e-4f4abd9819dmr295760931cf.50.1766684851608;
        Thu, 25 Dec 2025 09:47:31 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64e43asm142776531cf.26.2025.12.25.09.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 09:47:31 -0800 (PST)
Date: Thu, 25 Dec 2025 12:47:28 -0500
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: zynqmp: pll: Fix
 zynqmp_clk_divider_determine_rate kerneldoc
Message-ID: <aU14sKwiL_wJRUO7@redhat.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224114210.139817-5-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20251224114210.139817-5-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rPeOQ3NGEjiTJTNXkkgR7QnSIavDyBtC8UeGq5uvZ04_1766684852
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_094736_335837_3DABD619 
X-CRM114-Status: GOOD (  10.26  )
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

On Wed, Dec 24, 2025 at 12:42:12PM +0100, Krzysztof Kozlowski wrote:
> After renaming round_rate->determine, kerneldoc does not match anymore,
> causing W=1 warnings:
> 
>   pll.c:102 function parameter 'req' not described in 'zynqmp_pll_determine_rate'
>   pll.c:102 expecting prototype for zynqmp_pll_round_rate(). Prototype was for zynqmp_pll_determine_rate() instead
> 
> Fixes: 193650c7a873 ("clk: zynqmp: pll: convert from round_rate() to determine_rate()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for the fixup!

Reviewed-by: Brian Masney <bmasney@redhat.com>


