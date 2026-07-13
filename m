Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846F2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mC+p0RfcBB2FWIB+0G0/q5bKpwNLL+tjZ4djsboK4c=; b=JDRkpBD4gErS0N6GTKzVFSZXSo
	JLsawZ+9tb1ZFJ/rP5qrQsrwHRFuyTemaJzwpiUuJvO3qTfwOSHdKQYAmJJLHv1SA/FrThHMTdiTq
	4jaP8693/gRBTOUmPGV4wUb1nyKCG8jaDiCWS3p0Xx+UAL1eso6nwT0yma9i8H5r8LPe9jT8+eLcB
	yXs0fD/WrNnkD0GilHnMyLxkmlnOaR6G4LoXPiW1J5sm5EAHp5YzmqjrM8njQqTfxQo5SxKNTORiK
	rVlI1TFJoYlCAfZBaeehj+gDldxSpFQzya/PevhKypOCwB3J2u8YJD0uPB9ogzpaQU1c6h5eENDtU
	jMtcs7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEEd-00000008vbm-1gZp;
	Mon, 13 Jul 2026 10:50:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEEc-00000008vbc-2LqE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:50:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3270541A9E;
	Mon, 13 Jul 2026 10:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38601F000E9;
	Mon, 13 Jul 2026 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783939802;
	bh=+mC+p0RfcBB2FWIB+0G0/q5bKpwNLL+tjZ4djsboK4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D/7cW2OrAdKVpLGymKibNuGD64Aoe+sReSQeHEvNAyRX2yy4/7UKJk14wrq2Be28i
	 YCvezXwAwci9pA2rejSEJOWftR0IcmVf6vCslr+FhA/Fq6zqrXayGKRC3lqAAiMdSW
	 7F2/B1JIPN7SE3rexCmA3UcqetkfuQMe6zrzTxLXUjJSo5Ade5GiMS3XGlLDgrcliW
	 eIc1rFl35pNxfqTyBQS5hrHnlBRwMX4Qrldb/tqODR2oN/M0M1wirlNi02ygAqXB5y
	 m0NwxWnEGukBEgdF//MhT6bHwm+fHIGJ/jbOdJ+zjJ9Fy8JPWoyvsEFHsfxEwPQ76s
	 Hk1y1HpOSYP5g==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: sdunnaga@redhat.com
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Use 64-bit division for clock rate rounding
Date: Mon, 13 Jul 2026 11:49:57 +0100
Message-ID: <178393970515.1814568.15303004507285404021.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701195923.444270-1-sdunnaga@redhat.com>
References: <20260701195923.444270-1-sdunnaga@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 01 Jul 2026 15:59:20 -0400, sdunnaga@redhat.com wrote:
> SCMI clock range descriptors report rates as 64-bit values. When handling
> a range clock, scmi_clock_determine_rate() rounds the requested rate up to
> the next supported step using the SCMI RATE_STEP value.
> 
> The current code uses div64_ul() for this calculation. Since div64_ul()
> takes an unsigned long divisor, the 64-bit RATE_STEP value can be truncated
> on 32-bit builds. In the worst case, a non-zero 64-bit step can be narrowed
> to zero before the division.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Use 64-bit division for clock rate rounding
      https://git.kernel.org/sudeep.holla/c/bf1deecccf21
-- 
Regards,
Sudeep


