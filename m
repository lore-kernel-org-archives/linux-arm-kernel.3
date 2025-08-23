Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C624CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 23:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4jzGM5ciMuBpgya6EDzB+qy3/uT7PQPf5Xeg1kYKXQ=; b=Q77+QPj7G6oECT2M6A+5Z4l3i2
	v2Zh7Q6MAhiYoNOBVS5JZVq0HiilcrbadMCYlI7Nq/7iTcdhoHVH+BACuK5Vl1MPuy90/OaK0bZCA
	mfJJR3SUSSMmqoU9hPqtZ5gAO4eNWRJojcpzTkh/11Q6aG8CQyPLOhOkusf7p0b/MZxUIfddZu+yw
	3eXgnS4jJOn1wPUeVNIXVQcRfJt6jKxACJiTVEBTLI+pMXCzFwRnUTkrglQXOhhzZ1JArgo2aoDvr
	HbVJJb5p1ToUgMegKX2efrP/OkbJJnMVRaOvVPOjwRUeG2B54VQENJrb2rfNVgLFununevA4NLGgX
	93mM0DCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upxRz-00000005RnO-3iaX;
	Sat, 23 Aug 2025 23:15:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upxPJ-00000005RCF-31Eb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 23:12:22 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755990739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4jzGM5ciMuBpgya6EDzB+qy3/uT7PQPf5Xeg1kYKXQ=;
	b=yRdiKf6Xzdg0tg/k8BJeYcAjhOTTsfcX6Y3gXWyFLHf76YpHsENIvM10l3VJQaJ3UKoFz6
	VZ4ec+HSIZEcYRQGJg5jWbSAMZbb6pVHDSSGBQFhqQXT4dhrRjiqaKCg2WMleYHsyMEKZD
	R7E1kashRF5S7K2HtXE7a90FllMEzYmkQxGqckbmmzIRUQyjU2/AG2vDrH1IQ8IKGUVeby
	awrNxSLMbS9vFZj/mOGPm8n7eDV87DESJt0WNOpznMObtZBHxKgsL683SDzvTPf+eKYRK/
	Ejr9i0wGmMFnMhcoiQsfPMWvH0RcDQpOt1OyvfFpxsV/MIRqFsZg/b1hTVg/PA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755990739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4jzGM5ciMuBpgya6EDzB+qy3/uT7PQPf5Xeg1kYKXQ=;
	b=BpFVnIAGmmQb2tGQruKrp9Du9sPs2/cTF+FZuruKmFAshH8CoVP85R7eEyyFAG6VwowkEY
	Jhz89y1rTxtkNVDA==
To: vishnu singh <v-singh1@ti.com>, mark.rutland@arm.com, maz@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, jstultz@google.com,
 sboyd@kernel.org, akpm@linux-foundation.org, chenhuacai@kernel.org,
 pmladek@suse.com, agordeev@linux.ibm.com, bigeasy@linutronix.de,
 urezki@gmail.com, Llillian@star-ark.net, francesco@valla.it,
 guoweikang.kernel@gmail.com, alexander.shishkin@linux.intel.com,
 rrangel@chromium.org, kpsingh@kernel.org, anna-maria@linutronix.de,
 mingo@kernel.org, frederic@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] time: introduce BOOT_TIME_TRACKER and minimal boot
 timestamp
In-Reply-To: <871pp14pkr.ffs@tglx>
References: <20250823044034.189939-1-v-singh1@ti.com> <871pp14pkr.ffs@tglx>
Date: Sun, 24 Aug 2025 01:12:17 +0200
Message-ID: <87y0r93a5q.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_161221_898427_CA5D071A 
X-CRM114-Status: UNSURE (   4.86  )
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

On Sun, Aug 24 2025 at 00:53, Thomas Gleixner wrote:
> So the [0.000008] timestamp happens exactly 1.0 seconds after power
> on.

Let me correct myself it's exactly: 1.000008 seconds after power on

Sorry for this fundamental mistake.

Thanks,

        tglx

