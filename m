Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379CCC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XFHPq5doombv5JpyLz/Wpbmjc5CVKs6Bpy3BxDsQV8=; b=hSfm+2X1IONT+rmv3oUUo2yzFN
	8+CqAUdh0xrcRPjHwk2GmPya6qgOISmBgW0C7DEo30MD/u5vTPXJ3YiflW1ZffDTU4YnHHvHzIwFG
	VGFytvv3C98TIt06N4taSYJPqUUfY4XvQwoDemQ0YE9A9urvb0StG1Xx/K/kfRuh9CFkUx+TvFe5I
	W1KzXIXwPtvX8DmmVagl7u91NrMVo9Bs+sr+X8G12YcwdMIlLNmkXOn98VfcpNeHoTVEnC4ZOV9Km
	iNMcJaBN4tpKM8UCTd5ZqVoNhy9Z19wDch+db+w2wGr5o3mdX9TCYMe7tKZh19IG3MkqxEkSmd4nH
	3Zk7WReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlT0n-0000000556a-1fbi;
	Sun, 19 Jul 2026 15:01:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlT0l-00000005561-2wJe;
	Sun, 19 Jul 2026 15:00:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 81C3660A79;
	Sun, 19 Jul 2026 15:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E2F1F00AC4;
	Sun, 19 Jul 2026 15:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784473258;
	bh=7XFHPq5doombv5JpyLz/Wpbmjc5CVKs6Bpy3BxDsQV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eIcXzbQvV4Wy2N1R2hRKBwzyf8X5lOFVNxdhJVOZcffsmctfBv1TEGtarCMq2Wpyv
	 f6zfyHuSzqs/hRqLhDnAO9rI4SVPD9DND8BxAEuCDWWF1HHxU/axoUMhnhwXJiTkwg
	 VGl/igeMHvs5mJh6OTVFdwVO+k/roXgUVmPhC8b7FEXmiJjhbH7+lt2zKouM/onmCW
	 hCliycS0AIgF7/bS9topBdEFwGcbw11pb8TiayDFlQXLOYHJqUEgnmd3c0XB9Hqz96
	 uHYIoJpcpY778ggUsU4H9QzevesVT+LY/3wUUJgihizT9j2TEXQoPDEbTQ8jOI7GMj
	 1efSimmyFQySQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: Re: [PATCH 6.6.y 0/6] cBPF JIT spray hardening
Date: Sun, 19 Jul 2026 11:00:30 -0400
Message-ID: <20260718192718.0016-stable-reply@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717-cbpf-jit-spray-hardening-6-6-y-v1-0-e04f1b2893de@linux.intel.com>
References: <20260717-cbpf-jit-spray-hardening-6-6-y-v1-0-e04f1b2893de@linux.intel.com>
MIME-Version: 1.0
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

> These backports harden BPF JIT against spectre-v2 class of attacks. Without
> a predictor flush, execution of new BPF program may use stale prediction
> left behind by the freed one.

Queued the series for 6.6, thanks.

-- 
Thanks,
Sasha

