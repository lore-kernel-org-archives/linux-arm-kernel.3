Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9486ECCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ciiMP+aVPTGP01jthAKSkaUntJMAjHCa/1wZcaGOww=; b=24DJpR89vbtionJ1HT7oWc2TgX
	R+u5vUPwcCCnd78w+9DlT4aIG0AfqPBegSb2FWgItMTRz4GcDPwuRkhp6OFARCHt06t6kqGoEpOxV
	FUb8/NzUuLtCM97BJwIUWIXbmk2V4KecHUNTtH+P+trEG6esVWI0C6eSowMiJywhIuIDXUEeOQjr3
	kowDfXB+1EYKK0lyYxBZNozlem6o/8ee1j4KMxZr6huecHTknB2uumR6MPG3DBQXnZt10zVNN7LN1
	uYH/Vl/8bpZLsIXQLr6UPuPXkqObGTLqxxsyV48xfRCNpvXfK/kIblnJ7ABpVo2tUboG8YSWJxEpv
	6mQdANXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhKs-0000000Fnip-157O;
	Tue, 28 Oct 2025 10:53:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhKq-0000000FniL-0nMt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:53:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4285169c005so2676626f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 03:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761648830; x=1762253630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ciiMP+aVPTGP01jthAKSkaUntJMAjHCa/1wZcaGOww=;
        b=gtQ+kaI7kcgn8JxWboDiWB8WX+JWjq+nabMoJyOmSlmelmPQ2vtQ1tGGWdoAyfTlUw
         lnQX2ZHOsC5AiBid4aIC9HUiPXj//irJxEADBbnSr+1qNAJ2JIvZZciFX0Q1Wjf6e0zw
         6JfTWw4YYw0SXRtlDTOsziG+8c1GC78P8v4/pMmhf4ErVVydM0gtuZ6JfEEiNkGrJ1f7
         L/kKkmixclOGtYx09MuyUgK/4v46jU0TKSMxMf4Q6kDdKc1S4yKEcyneUq8lP4AYJVOB
         8D02XspzRPAzLZZ5QkiKYx9S9KPh89QZtjSILlgTNPBQfrvGoJx91V1Hyqo1Rp03FynK
         wYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761648830; x=1762253630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ciiMP+aVPTGP01jthAKSkaUntJMAjHCa/1wZcaGOww=;
        b=GrRnSVAu7FeK/FHecbhJY1C2tMFZ3kr1UBszJcOvz+ZTukuRwDPPu7bLQqoNugsxlM
         NmVNEPr6LE+4D1HFBUpVopPR6z8j6Nn7FVISxw/C/sQ71jrnnag5riLE32VsmpVfnLn9
         K0h8XFPnaIIDUKHpP5qVCYnGeFQbO4aOVRW22apFfrd++YhIEDQ2X5EyQJsPIxHBU9gJ
         RD1nfJIiisF2Sy00KnAlz3RHQRN6atHyAGfvX/TUXlfehfapjJ2t2S+qWWdz0jfeJetJ
         SaLS0umQ2Zue3J9szirVLlsN29PVBWx6EJBTWuGH1sC2qz23G8S1XZojwJ/Cl4UZsZBK
         8bGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCseFEcTekQOsUNmvGjc3d8yd+fh02FtA43sbaOBLmog75rU0O92nQ+1btaywh3yDlug8uqPaHwgUixWGQfGeC@lists.infradead.org
X-Gm-Message-State: AOJu0YxRpAmCdIMwK9pW9lSn3zCKgMnjKkhsqT7WcYlGZj9VfvPKfcb7
	4a4ctvdJ8ppHB6EeYR9tVCDdiNzhnfLYocSW9+BXMfDKgnYlJezrd+RZi5YU/l7WHsw=
X-Gm-Gg: ASbGncsEJuTg7c0LDOe5PeLeZd8IZj9AkjER54bQRDVMTN7PyCDAwn7cnI4tR9+QFjd
	b5/o11b1YcEaJ0DBimUeG7CvOyenvul++Iy+FUn18znWRSbLqc2kLhkouo3sEgwqM1E9lExbdvg
	3obU0npcXM4Jbb+cOjNu9K/CdVUmz5zLw8bV/l4AsRCSucg0Fcxq0InHnEynUmQTT4BUmKq0lGe
	kun6LJWcf4EVPFMe25jne38y0faJ/jOPefsy7yVoNdQoesn9YuEyjoKn7h4Ik4TuIwMrNAaNqKB
	x2XpSHJPWhdp9l+FmToKwfusMgy9gxdTQ/IcTAsRKUdL3wsF/f9tfpO7G9lGkl/NGNtSW9UTLoK
	prMoz8oZoyPHlr95trSLaWp0StmAnNlmafjJ3cto2AMm7A6VXj63EvyN9ouGRw/JNIxVsWVkEOC
	4CmGiiUsUIi2puylKgk+kA
X-Google-Smtp-Source: AGHT+IGNt3x1+qvnQdvPMrB8YbMOh25mEuFQD2Py5L6FbHFNPHpPfAZVVrBrzGdO5MKQniNEUyPgGA==
X-Received: by 2002:a05:6000:26d1:b0:3eb:9447:b97a with SMTP id ffacd0b85a97d-429a7e8e222mr2559278f8f.54.1761648829920;
        Tue, 28 Oct 2025 03:53:49 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:7f41:186a:1d61:ae59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e21sm191479545e9.9.2025.10.28.03.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 03:53:49 -0700 (PDT)
Date: Tue, 28 Oct 2025 11:53:44 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
Message-ID: <aQCguL11h6oa5Y4C@linaro.org>
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
 <aMAkJ7CfPQuhvhfm@willie-the-truck>
 <aMBJNzXpQTMg4Ncs@linaro.org>
 <d73e5026-ccb0-4a19-9742-099a0443f878@arm.com>
 <aMsJHheI6Y1V5q74@linaro.org>
 <aM0LZVudBKjWuVrT@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aM0LZVudBKjWuVrT@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_035352_247840_14B557F7 
X-CRM114-Status: GOOD (  22.74  )
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

Hi Robin,

On Fri, Sep 19, 2025 at 08:51:01AM +0100, Will Deacon wrote:
> On Wed, Sep 17, 2025 at 09:16:46PM +0200, Stephan Gerhold wrote:
> > I realize it is weird to allow non-architectural features like this, but
> > I haven't found any indication that the additional SMRs work any
> > different from the standard ones. The SMMU spec seems to reserve space
> > for up to 256 SMRs in the address space and the register bits, as if it
> > was intended to be extended like this later. That's also why it works
> > correctly without any changes in arm-smmu.c: the bit masks used there
> > already allow up to 256 SMRs.
> > 
> > What do you think?
> 
> Although it's all pretty ugly, I think we really only have two choices:
> 
>   - Teach the core driver code about all this and use an rmr-like scheme
>     to leave the upper SMRs in bypass
> 
>   - Hack it in the impl code as per your patch
> 
> The latter option is probably the most pragmatic (especially considering
> the need to handle the virtualised case differently) but I'd like to see
> what Robin thinks.

Do you have any thoughts for this?

The stream match conflicts that happen without this patch still exist,
I've been testing this patch for quite some time now and have never
noticed any issues.

Thanks,
Stephan

