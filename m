Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CCCCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m05e8ZK6LdKO8zCgzV0KxhPr/bGmY3Qs5lVi4T+Cols=; b=KW7d9huIxOs123vXpXsYZh4Ulq
	VcYxerDN5jybXlvfklGweZAIghnoPjZGA6dkOWIoMvEyirRtf5xcOfZCBAWNj26Nm4uQ4VU4WXywz
	dchnxWWEe9h1ibV26WRqWLfIIue4N2lrscuu/57cW8GssySITlesywxk76MJIFK6mOQZQbf10kK+e
	4vY6mPmwTHQLHHvuYzoEO+ym0g3/T//MH0k1g7XoPDRjxvGPMENrnQlonS6LBNJtDRuXlpaRbMbJo
	hUZY+OdotNk78UzLsu3IpqkuCooGnMMiM7kqdUdvs7mVeYH6nUbuGRjZk0Q9wAgXxwTaBMKbANDtK
	Lj6ZmW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJOV-00000007ogR-411H;
	Wed, 10 Jun 2026 13:54:59 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJOT-00000007ofX-1wlC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:54:58 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45efb698ef2so3354554f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781099695; x=1781704495; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m05e8ZK6LdKO8zCgzV0KxhPr/bGmY3Qs5lVi4T+Cols=;
        b=nml5EgbckFRkofoYxsDW6kAQfwoy49ArnopOLbmjGhXNsQKq0iStajUIplInDKPLFT
         V3/pASf7ejlhu8Hxr0DNAFQmC3vHkYInSFQ3MKAci6Cnx62oGvBRL1Qg+tt/PbTIHY34
         yZMDrfRoYU8jB8+dIueIhG3op4OHYJB6CKp+ihxjZwXthtaHRvHPfIiY/pR0qkwvuFZP
         IyfaLPzRUQKgEiqLl96CYLo86C88wzT5qR7wPc1qpguf1VzvZi+rp4dBbrDjTEiz194V
         rh2B+hjmeDr3aByZpKrAsjHCObMNVrP8tROEKFYnQpADsJB8AgWfTmXQ95i/fEDzc/jK
         8ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099695; x=1781704495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m05e8ZK6LdKO8zCgzV0KxhPr/bGmY3Qs5lVi4T+Cols=;
        b=YC0ah7Z7deyBczwGXCuy3PXdvvGNM7AgWC+THg6XSnwvdIlSKbyoCsNWPvwTqJ3eGW
         rHrC6Sd5aB97olBrEmYjMrYLySQ3VOEH13qBBDHsiSnwuLGC4nqLX20DZIfXi3s6iUx8
         CVU8ZPx9nPRiXJ0r2I/BHr6GYQ+ekraCRyyWUEZI9rZV7Pfq2QBbCd1a+HBuxv8LP3wi
         +XmGDUomlYu2ZE50Hkq2KIf7s2stcHc7GP6iwUaBQIajocpRKftPjt6UYMrq0jyVRX+A
         DQ/ALe4EglzewCMdXztlGZ6scExoT0yGBbPd4uQBu+/OwrShHxav+1Gy+/VBkS7gh+Fr
         tsEg==
X-Forwarded-Encrypted: i=1; AFNElJ/rHjHkjSA7Ar+BJcF+MC0GJHs6d1rFLCThP2nSLMg4SVPl0C/hsSytvyL/VMXt0fOZ7gL+nOthl2117W11B8m+@lists.infradead.org
X-Gm-Message-State: AOJu0YzYBTXjdHNf7TcqLcwIllhzxBheCpNUNdEIqozCvSwrztIWMg7X
	GRUGBpf+HHWwu2/X79Qht6Rysy2jW66/GYiNl/y4pMx6bRJtET5batmvcSOcnqCsn6E=
X-Gm-Gg: Acq92OEjj4QN7736N0NIo0waB8N3WRNUOuASVEqZ7SADiAd3lHtNR/lovY47wFc6vMC
	mfd0tKAFqUC4JfhDF8WDLJnCZAKVDLrzqdULzcnvq3Wnh4HYTfUpl/nlHri0cI6KkA8izi94H4d
	YgPDc5XyC933Asn5a69rupoXhjZUlKJb3v+pD0bkd0+r+4mqjKdv+8fJSX8vTvDwl44v0krjw1Q
	OgqfbdX2ZT9K2WWa4+ebfRYT4hzt7rRSoLyUiSH40vd9lceaTu7haO3Sq2eo1hSFwTbVzVR7LGA
	CCgq1+qU4J8aTo+DkVud7LJb3kAWyCZPOOCRFtbFQ3fN+mUqZP3zzT1h6S0trQn2FVXZ2N3Nfa0
	R9+Q4c3yiwi2BLczRXMD5cpC8VSgFwMDutF8pOtkY0NVzpurtElwn/qkcZkChyrCJ4pSNcSxFi4
	U9gsktYR3YDzFlGzkaSdvpWu4QekS4+OSDtBSxiPRl7trreSCIRgE+Az1SXQ==
X-Received: by 2002:a5d:6910:0:b0:45e:f073:d2fd with SMTP id ffacd0b85a97d-460302ec5b8mr28252555f8f.9.1781099695344;
        Wed, 10 Jun 2026 06:54:55 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:7c57:ff85:2733:9342])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm73006149f8f.2.2026.06.10.06.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:54:54 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:54:43 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] clk: qcom: Add sane defaults and drop defconfig
Message-ID: <ailso2RrnKPUtwhI@linaro.org>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_065457_526307_1F49A4CB 
X-CRM114-Status: GOOD (  20.80  )
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

On Tue, Jun 09, 2026 at 05:32:34PM +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Significant rework:
> - Add more commits, also for arm32 drivers
> - Split defconfig changes to separate commits, so clock can still go
>   this cycle and defconfig later. Also, less conflicts.
> - Link to v1: https://patch.msgid.link/20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com
> - Dropped most review tags, due to changes.
> 
> We should not be really asking whether to enable clock controller
> drivers. This is obvious choice.
> 
> And if it does not seem obvious, then consider [1].
> 
> [1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/
> 
> If the approach is fine, I will do similarly with inteconnect and
> pinctrl (and maybe others).
> 

Perhaps we could add some option that disables the defaults for users
who need to compile a minimal kernel for space-constrained systems? All
the clock drivers combined can take up quite a bit of space because of
all the clock definitions (a quick test suggests 2.6 MiB on ARM64 for
all gcc-*.o), which can be already quite problematic e.g. for MDM*/SDX*
systems with sometimes only 256 MiB RAM or less.

The defaults applied in this patch set can be individually disabled, but
this becomes quite a mess when you really just want to have a minimal
configuration for a single SoC. Whenever a new SoC is added, you need to
go through all the menus and disable all the new options that were
added because they are going to be enabled by default.

This could be easily solved with an additional option, e.g.

config ARCH_QCOM_DEFAULT
	bool "Select important Qualcomm SoC drivers by default"
	default ARCH_QCOM

config ..._GCC_...
	default ARCH_QCOM_DEFAULT

Then you just need to disable that one option once, and all future new
options won't get enabled by default. The media subsystem has something
similar (MEDIA_SUBDRV_AUTOSELECT).

Thanks,
Stephan

