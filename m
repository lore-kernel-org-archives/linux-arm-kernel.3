Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5BECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 16:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dq4LCZrUHOBpWDtuS+ZDVNUh4OO0Y+T0F6gJsifopzA=; b=U8tblVMxvUti7InU0ooEIPNXm4
	3C2vvv6UtPmd3DHj1VHGZT7LhnVIQ56lGq1vcN5FPeL1VDa6f/D3UQiYt4Z1DXJkmd1BdhVyBoafO
	NhM3pg9FXu1/MeaKqPq7snF9AeXDfEK/66rWKXEsAuFokxkWoaRX6XxeLRMzI4Yu5kRovUpGMefLO
	rfnC9sKY5l13elB5dmP6mxgpnjhPZClpndXAWULawD4nRfK05zfFcpn1fucsMe+En55W62zY5Bntn
	umOj62nNwUMMkkGXTSu4ngd/nGB5rPHJkjyGMLGt1unEPb218e4FuOrXquy3pgyIIFyaNAsdoPDYe
	n4FcMMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqMM-0000000HRcy-1SQ9;
	Tue, 12 May 2026 16:53:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqML-0000000HRc0-0ZqN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 16:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Dq4LCZrUHOBpWDtuS+ZDVNUh4OO0Y+T0F6gJsifopzA=; b=GXg6VS6YkV5vcI7Y3nS4utS8ry
	nUfkWEcE5idaRTrkHXhbbi/azhMTlFzKmZhTxTYiXw3Skw5sJstILTgD8RhsJxUuxtNCv9c6SKlHZ
	c2L2tjtRidcKuJSyqerT7tYtP9EVaSA8fUX+JgnGjpy2EwlbKL8p4PJHL77klAxwTpjAQV0KZH0g9
	xpXHa+CSSyPvbY8761/GPZ2XnWQYdkkeFOsshjs7x5/ZCF9DOvTR8XhmCT7TIlJ/YljQVlox7d5sU
	UAj/YXPi2yz2LjPM/cQUCplbspTXP2glgIWCvqjgT1vrFbLiHKBzO7QrlgAnaceCY9lxvdQv9Tz2v
	TsNWCq1w==;
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqMF-0000000FPHg-16wM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 16:53:26 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8b7ec7bedcbso28034746d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 09:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778604800; x=1779209600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dq4LCZrUHOBpWDtuS+ZDVNUh4OO0Y+T0F6gJsifopzA=;
        b=a0EqUelL+noCdP1GQ/I2o2g0ZHHcOeRu+zLY14a4p9TdMviE3zu/Bjpq+8k6aaFXqe
         v3/0Vz1Y7q7Ukt52/6Gj/LZMpTER/ldHVtZbxUShFGSjUE6bv4UD+X9o1h3HlN5AQLMk
         rJG5wH64ikB+2UAmqyS50IuuPbUkt4BEOSCCNd+gULs05XLhveTMpHznX1tLieX0RyFD
         u2S68ydMBX2OL6oSVAwqG2pnzexXweXbSnhszVGPUTjuQzlpJybZEMGBukXzlO1gGpTZ
         AIGl26i5o1dboog/MTf2v0MxZUa57l+MBrUKpSIQs8BvO30laJFFDSbcq2/LS4mxUdyh
         hFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778604800; x=1779209600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dq4LCZrUHOBpWDtuS+ZDVNUh4OO0Y+T0F6gJsifopzA=;
        b=jW2AUsL1F50p7fv0ff9JaWs6JI+oGpsq7RufTV51hwCS8FzWoMdp/n/sBvDkvtwL2Z
         m8nE6eaDqVTvi/NB+PJmfyvOUHZLrMZ/yipv/4FmqcUvWEomjD2cwnTfr/OF5rcFZ+f+
         fjY+Ivqj+nPWidZroSAIKRzA3yhD+5Nw/1NsUbRgE+0eTHY8IrnzRoghei0DcvtgjcZ6
         xbtGi4rsoXJC3AzlFcmoZCquI32jKNRCBpGwE41bS1gvVRTgbwyZGpQZP255xqI6Sb65
         wPJ3xc4Wu6oAfIMHCwCw88yspwrwsMpphSYGp8F4E4q+bcSHX7eVJaewOVyOyocJFyb8
         /DUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xHwdyxnGSQ7QbY/1xr11M5wkTFdb+WwCnbXqmSggXIOcAi6YiStr5FJABbuBxayiVmZDeL8uKQu3FGCkYEu+k@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ARb/IYLV352UeMIpxCjm0woERmoKHMOLvsEhqF2J3x1wnba3
	fH3lOycB750NUpzNlalTZuJ/61gs/BHXMIZTX+EF9Sa3ASHpsprpEnXZOuqWiXWuCJM=
X-Gm-Gg: Acq92OHftT5MdCXUGTEVjwMxGuqMUHGcf7Cc7XxkYLYtVRGbTfSEb/yQuRAZ3cHOUaA
	thBp2ginJ+QnIfuHLpm25RpXseXE/LD/cjRWwcGCjuYXMktUCXpH5bVM/Rzd5HEZ+yYaObc5tu7
	sOXiNxDd/fQdnRvvNvD2bXGc2R1q6tjofuVsANKMY1Bvam9APeTlFVeL0LcXugK92y0GT7RtJ2s
	fOa40MjJuF1dyo2U1HHSkyQSI7CUKlzDiO4SB/RcA3OoQUQs4DKDuntow3nTQ/oPZC8HVybBdMh
	B3Swo3asqCYK2IKcXWaDMbxHnDCWVZ6szRgHNkr2Yk4MpKk8cp+FbsorZJZ8sz/oorcn9F0VSRl
	l5p9nSODvmFmH2cVRqsksLPdsyo/Lcw1MtN207VuCJj3nTm7CsmbrbrTZHPVghxuZOyTVN26T18
	tQJxVQXbkM+GKF2qok6eBeR9njj5kRKAqUMzNFTmNwJ71YKO/I1gCXQU5U7UpeXw6WcLNeNwMmB
	La3NBk/e39dxMB5Y8yC/EpPAIBs/TXZ1nwn/H7tO/MS20M=
X-Received: by 2002:a05:6214:4c48:b0:8a7:1498:5f67 with SMTP id 6a1803df08f44-8bc42f5313cmr414441406d6.18.1778604800418;
        Tue, 12 May 2026 09:53:20 -0700 (PDT)
Received: from mighty.tail79ce1c.ts.net (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e032sm129797216d6.32.2026.05.12.09.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:53:20 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: nathan@kernel.org
Cc: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	bavishimithil@gmail.com,
	kees@kernel.org,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@armlinux.org.uk,
	llvm@lists.linux.dev,
	rogerq@kernel.org,
	samitolvanen@google.com,
	tony@atomide.com
Subject: Re: [PATCH] ARM: OMAP2+: Make OMAP4 finish_suspend callback CFI-safe
Date: Tue, 12 May 2026 12:53:18 -0400
Message-ID: <20260512165318.442-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512135757.GB570003@ax162>
References: <20260512135757.GB570003@ax162>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_175324_260430_05B3D456 
X-CRM114-Status: GOOD (  10.44  )
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

> I don't think we have any formal documentation for SYM_TYPED_FUNC_START
> (it should probably be documented via kernel-doc?) but you can read the
> commit message of the change that added it for more information:
>
>  e84e008e7b02 ("cfi: Add type helper macros")

Thanks, I had a look at it and other similar commits like

c50d328 ("arm64: Add types to indirect called assembly functions")

I was not aware of SYM_TYPED_FUNC_START before hence the logical approach
was just to wrap the function. But now with this I'll send a v2 with the
ENTRY and ENDPROC changed to SYM_TYPED_FUNC_START and SYM_FUNC_END.

Best,
Mithil

