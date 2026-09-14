Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E67C88E74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xL+w0A7odYZKbgPjD3LYTg1FkJZDU1JNwqhLQiGIknU=; b=V27QiHIQUAK5dmmpRfLWZ9niPp
	hxp41Egt4DHjqfToOzhcWD/Df2+4R9NH04H6XDdtspvE+dN0ypHGFtoBG7fH5WnpVGpNIpDoziw/X
	vAsPmLqOA3EWOYyZkC0Q3Q8p77lw2MwgF8UlHYPkGoxPo4rZkJrq7aViP7nhQ9hrWqpxu+eQwFNsi
	YV9EVPuHXDTtw1416prz7DBTXnEAdDlthPBoUqUPeqXTEysW/dfPHehXcmGKTcwVuXBN/Kjxx/yxb
	kt+8DRA98UoG7GC6Ktg+PxVszEG7g83l5zezlyGtsDAIoXYSr0cblU3Ma7FCAl8QydH2IpjUmUFIn
	YyoKQpag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65QK-00000003T9Z-1KPX;
	Mon, 14 Sep 2026 12:04:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Py-00000003SvV-3jI5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:04:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 80C0D403EC;
	Mon, 14 Sep 2026 12:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631091F000FF;
	Mon, 14 Sep 2026 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387454;
	bh=xL+w0A7odYZKbgPjD3LYTg1FkJZDU1JNwqhLQiGIknU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TuWxPxBFHC9LoXlGOw7d4y5OVtsciOJkh+MEpI8FnXpIiYxyAZAm3orwr0GMDIg2s
	 EjscSw1hHlwqk38h29QvcTXRW3wPjDM+cKNm4gVHQFqvvg605sbIhmidwQeZKc+EF9
	 mM7kBsRvzSrhkWX0tMF0CehBYZLkQF1RIFi+aZoBdrn9JEVb25bhl5nXjBKdd+s7ig
	 VN59yc0yTGSjGk7W2qLqsjVydnzU9nTyfQpEdOlVb3dDigsyYsIcbOGiPWrLWFVH9h
	 RSErhL7bb2yOLF1OTYx7ElCokfgnLWHKMwyJo7tKPcLXpR6PQFQUtxscz2VkWS2ysm
	 lfSuaLz81QQzw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x65Pw-00000008bEQ-2nlv;
	Mon, 14 Sep 2026 12:04:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: catalin.marinas@arm.com,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	will@kernel.org,
	Sebastian Ene <sebastianene@google.com>
Cc: joey.gouly@arm.com,
	korneld@google.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	android-kvm@google.com,
	mrigendra.chaubey@gmail.com,
	perlarsen@google.com,
	suzuki.poulose@arm.com,
	vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v9 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
Date: Mon, 14 Sep 2026 13:04:11 +0100
Message-ID: <178938739472.3215146.2334012997642467231.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
References: <20260907171930.4037166-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, oupton@kernel.org, fuad.tabba@linux.dev, will@kernel.org, sebastianene@google.com, joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Mon, 07 Sep 2026 17:19:22 +0000, Sebastian Ene wrote:
> Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> FF-A proxy. This restriction was preventing the use of asynchronous
> signaling mechanisms defined by the Arm FF-A specification to
> communicate with the secure services.
> While these calls are markes as optional, there is no reason why the
> hypervisor proxy would block them because:
> 
> [...]

Applied to next, thanks!

[1/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
      commit: 5224e6f027ee8ba0ebc825ce80c45c0a7b716ff3
[2/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
      commit: 85e44f7eeaec6c303fd6cb2d775cbfecebeb6802
[3/7] KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
      commit: 69fde06ec15936551f97e67c7bdc93427e8b08a6
[4/7] KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
      commit: e3ba9aec202ae2911ae1166654e21bbbd41ff29d
[5/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
      commit: 88180874ee3474ce866a00297aa238c64fc2ea85
[6/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
      commit: 0aa3b20bbb2bf165d32fd802204a558fa461b130
[7/7] KVM: arm64: Enforce strict SBZ checks in the FF-A proxy
      commit: 3e9df0b0ebd57e42b43842c996271275588660a2

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



