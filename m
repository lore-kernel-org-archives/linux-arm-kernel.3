Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA50CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSgZXwm4hvrVwoAJAoET78JUvjtvH8l4XQi9FYyT1AI=; b=SfQ6ydfva6Eu2fizrM+EH7eLOb
	5y407nSZgkiPeAZvcRwkO0PtmNIY5qX9setQv7RfJncDYyYgugHFb7pXSIVVaqJmJh9fybopwVvGu
	kpKk2Zdb1sZFHyVVw+zpE8V8qyVBBwKa8Ol8AaSEOnAXCaa3/3d9wcnvZVFtMRrf4hjzJ1ld06/j1
	6givgLEQYKwddCBEh855Fkkd4RHMqi4BYffjLwTH9kmTYqnoBrIEiojL/QwtRqqGB4ROBREoVY2TD
	pLpLnrpLw4zMmoSyWBaK4WMUCQ/53yrG90F52NjxGkAojessbUmpXw3JbxCkO2+aroO1DJXkU8ATh
	w1Kf8m1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAUZ-00000003dFb-3sVg;
	Wed, 27 May 2026 09:23:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAUY-00000003dFG-03nf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:23:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27CB2600CB;
	Wed, 27 May 2026 09:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B2C1F000E9;
	Wed, 27 May 2026 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779873836;
	bh=MSgZXwm4hvrVwoAJAoET78JUvjtvH8l4XQi9FYyT1AI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fHMjafNBSazwaUmfT3nMZN+WVJk17zpuzdlhKcTZzzCrELfoEgZheDd2dIuP/CMX7
	 T6JE7+jcw6PmXwJ5MEGgM6EEbuqjN2tbuRKnoOfR5c8AnvkIs0hBI2CP/Y2SFiwcIj
	 8DBI9gA7KLPY61Gvkgn58Uli8ZC4qEJdDbzrtjYnaAM33E4p/nr0MOYVuZ/WEgNW86
	 C3dfP0idXB8ac0t/n+0crtEHpaxWbbgX7lZ1rlRqLdCxW5uuyAgQ03+qlwLOZ5Wn2H
	 VlLOH7EtwKhpretUthkHfMrq7zWZAhVLjaNsSvTj6RJbAUrC3gtrrd8oU4KSnYWhcZ
	 M1E8ncE5WL58w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	gatien.chevallier@foss.st.com,
	u.kleine-koenig@baylibre.com,
	dakr@kernel.org
Subject: Re: [PATCH v2 0/4] Rework SCMI transport drivers probing sequence
Date: Wed, 27 May 2026 10:23:50 +0100
Message-ID: <177987374695.279042.10837727890884135101.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510160527.3537474-1-cristian.marussi@arm.com>
References: <20260510160527.3537474-1-cristian.marussi@arm.com>
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

On Sun, 10 May 2026 17:05:23 +0100, Cristian Marussi wrote:
> when the SCMI transports were split out into standalone drivers [1] the
> probe sequence was laid out in such a way that:
> 
>  - the transport drivers would have probed first, triggered by the firmware
>    driven discovery process (DT/ACPI)
> 
>  - afterwards the control would have been passed to the core SCMI stack
>    driver via the creation of a dedicated device that would have inherited
>    the original firmware descriptor (since that same DT/ACPI node would
>    have been still needed by the SCMI core driver to be parsed)
> 
> [...]

I haven't seen any reports of failure in -next with these, so I am happy
to take it for v7.2.

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/4] firmware: arm_scmi: Add transport instance handles
      https://git.kernel.org/sudeep.holla/c/9dfae7d2edb4
[2/4] firmware: arm_scmi: Add a generic transport supplier
      https://git.kernel.org/sudeep.holla/c/ab6eb28a47d4
[3/4] firmware: arm_scmi: virtio: Rework transport probe sequence
      https://git.kernel.org/sudeep.holla/c/c08051901a55
[4/4] firmware: arm_scmi: optee: Rework transport probe sequence
      https://git.kernel.org/sudeep.holla/c/524abd2fa690

--
Regards,
Sudeep


