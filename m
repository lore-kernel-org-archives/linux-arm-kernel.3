Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B272CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=zRjmDYp62Q4yvNnx+txeuuuXEh
	BcW+BhDgaJgIPkBPOhVO4BSTHFD3Q5coIZZQhw6CPY94fhLdE23y8cnCvyJJrafgPdBTt1sYf0T+2
	AEVYkKJJF3ph4OD8jcN6atct02sUwLu8pKan9Nktm6McUY67J7YA5DkGOlAjSYiafqmJxNoGLmvo6
	IqNBT3IybNdwyoGfRpFo5DX5KC+BR8dlAayov/uEuauq1pFN3j4F8X1Ke3bsrvazogM+W9e3K5ENJ
	Bmub2fWylhIqachwiMflSVq7aX6hEd17F6Ko3UX9T5nwF3lb4/kC5Q1V8jp3cr/qzbavpWS3UPz0i
	QQTVMDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE23A-00000000SHT-1MrG;
	Tue, 06 Oct 2026 10:05:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE238-00000000SHG-2YM0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:05:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D53043ED3;
	Tue,  6 Oct 2026 10:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BB91F000FF;
	Tue,  6 Oct 2026 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791281130;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c56DuBcZgAV4WH5REJBc5z2aOk3I31dn71zLwT0yLPkTYcNrM7NigXV4hajNci48q
	 me2Xfa3ey9M0lTttQrqo8Iy+nW2u4l/Vm9ETvb3fMKe1aesk+WbRiDXCZCqXmEmFc2
	 S5rZDpZpWh/KU2GIgMkK1dwna/FKf10V2iPrRPsi3Kw0Du0n0AcuWWDuijkXp/ZN0V
	 uubCnozaj0SApyNfrLW4sUPc+cjolx1V2iJBBc2soemjsxEM6F6EomZ6DgMwNfllKi
	 DEtaKhIIqK7JTpUJWlgYrN68HcgzGu2qeu4J20aNGh/3/xRR54lpfdxW3KkP/qE7qb
	 dnJCXAMUvVpGg==
From: netdev-bot+sinfo@kernel.org
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [PATCH net-next v4 0/2] net: stmmac: introduce XDP rx multi-buff support
Date: Tue, 06 Oct 2026 10:05:28 +0000
Message-ID: <179128112868.2231598.3214023601488420681@kernel.org>
In-Reply-To: <20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com>
References: <20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

