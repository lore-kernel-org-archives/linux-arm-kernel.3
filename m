Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DE9CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yAV+C6S/vBnhLrjCXwEiKS2AZjZdz8SQL6UJRh8bA3A=; b=0iE/y2KqP9St6r
	fvzB2rboAp3sBIFLkfwMGzjP0yYplaGN5Vgi+eRon4nS8uUNmk1KY+5IBQ9yMeY1oIfTsEyhY7K5k
	goeLbZucVUjxE1hUSg97klZ9K5TPQlQkKmJsvljmhKlJfbmZmTHoBvuilZinBF7TzKwDDscYMQlGm
	ljd+mj7FUP2VrzJ6KSTidSNslh50OTOUmmv/36ZlAhDo+hAwNgfjhAQ641CtByLaTLnzlCXbS927R
	us6QL+hEL2tWXDQwG2nWgxv5EQdTPN83GM2wWQOQKZwslZHBp+H498q79108O54BjvYnMhWeBL1EH
	w3homJl9shimiK0G/AnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxXB-0000000FNql-37ci;
	Wed, 14 Oct 2026 11:52:37 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxX6-0000000FNph-0WKE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:52:33 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3282db206d3so2605310eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20251104.gappssmtp.com; s=20251104; t=1791978751; x=1792583551; darn=lists.infradead.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yAV+C6S/vBnhLrjCXwEiKS2AZjZdz8SQL6UJRh8bA3A=;
        b=yLhTzTTGR2JFtl7u030TtWWOtfq0KI3tDaSYMw+0ocUNNKWg3qDR93dWFgYNE0LVKJ
         o6cMsvu+tZityVMPEPzRvPFORH3riMGob1/+mEibhiux3FT/2SzIenIYOz89qwhH32Nl
         psmLAScV6On/qv/X7uW+E/HfjD1V/1rANpQUGh4936TEyvy2Pio4oolev0zIkqz6OpYu
         R7QdrXNgdozAjrzQYadMI6i3PnKRSQ01TGLTQzApfkSk0S59jAdird7SPrr41DDzJj6j
         xekolFeoo+bqegMsBBLU+0zMoXa7avhYgeCWS3DBbHaR74X1IakcgHHiWs9OiMxjVkkN
         Dx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978751; x=1792583551;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yAV+C6S/vBnhLrjCXwEiKS2AZjZdz8SQL6UJRh8bA3A=;
        b=lbWUr2zfj394V97ilRy5ryV7TNDpzb5dQKHVl4opsuB40qHlR9rM/wbMIAw7DHIrfF
         XN8LyHfXd3sUEBEwUXKJ6HNEAYB3s2TpSpLYl6NE6P3zYUJwBQIBSMz3yh3xRuwgh+3S
         3IyXgDr2jY7x26NB8LGHQgXdpN5DZjucqRlItBnrw06nAJNd6zo/lhBI1DFyD5eXmJ1s
         WVUSpmWkVs/Z8FfOmkmbRJxXVWSCjwXhDt1MvTdLy5j6ELu55Pqk9LccwgKHta4g4rQi
         bkTWTWqEQXapqSR4Oyf6L2STOY7rLAt3ffHAXPgtpgJHIAdpxDXVwKJUyqQe7MUpFpqE
         nByQ==
X-Forwarded-Encrypted: i=1; AKwUvBwckDv1DgrLUogDN58oYyieqZXoIFp7m2MoWddQOpUKEJ+y5VwmZLqxwHp4iunnq+7o3OhSOiWJcW8nxwFHVOP/@lists.infradead.org
X-Gm-Message-State: AFq9FYKowGlFzzvgCKjSIJ5KwvkqkrMEJ3eOxSA0AbkMRagV2OOxFDfY
	Ry2j6QYUG2M9BzPq/tt3qQiXtA16tinuNpL8VrqydXgU9ZdtAyFN+EMRoN0uHeiBlL8=
X-Gm-Gg: AYBFou19Sd/+6KNmDZbDRPRpdujvr9cLICglalG5Va1dMtuI43W5zt85QRsmMoWvwWW
	pUY7cOyrGizMw+ylvr5WBUrfMUg1ITxJ2sleFMNrMc+fdhNJ/PovzN5xehXm/PPfzZx0ACmfm1M
	ZaF3G/mCgnwAy17BVILrAuFroCLb5sYF3PyPf+XxOcXo58kMgSExhPcF0UEKKWrCBtWMSX5zYrl
	c5yhC4EHXI+bvm4uTpIpbylA4Udowc14oGeYtYQMZi9v4z/3vKNiWddx1jSNBQDlUmxeqTc+5kx
	5snF9/3d5V+PvVZXG4rYZKL2wF6tVBdJMWuKv84zlh840M5Lgb8mSi+8s5skjgRGdYTnWBNbe/G
	TGJhobsW4xoERzLwEpJAiKXuJWTRc1Ic1ltY2zRv96aksD1Oe09JqaVb/FGWNjh0+Y7GzCSetJC
	bq0EyTNmnWgciZUNNHMfY6eLBvTLzBD2vTRi9gBcu2hEQbBp0SH4uCrIPt3TfXnVS9RjYj7dhZU
	eaiwH6+mfxBrXQLfSjVqszILNTL3446RAOXs1PG
X-Received: by 2002:a05:693c:810e:b0:359:861:7cbd with SMTP id 5a478bee46e88-35908617e44mr16791919eec.10.1791978750686;
        Wed, 14 Oct 2026 04:52:30 -0700 (PDT)
Received: from localhost ([2001:5a8:4687:d600:c5e7:8e91:8246:979c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm15935072eec.23.2026.10.14.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:52:29 -0700 (PDT)
Date: Wed, 14 Oct 2026 04:52:29 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Oct 2026 04:52:25 PDT (-0700)
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
In-Reply-To: <20260710-romantic-dashing-gecko-e31a98@sudeepholla>
CC: michal.simek@amd.com, cristian.marussi@arm.com, sudeep.holla@kernel.org,
  linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
  Souvik.Chakravarty@arm.com, alexs@kernel.org, andy@kernel.org, brgl@kernel.org, bmasney@redhat.com,
  dlechner@baylibre.com, dzm91@hust.edu.cn, festevam@gmail.com, Frank.Li@nxp.com, linux@roeck-us.net,
  jic23@kernel.org, corbet@lwn.net, lenb@kernel.org, lgirdwood@gmail.com, linusw@kernel.org,
  lukasz.luba@arm.com, broonie@kernel.org, mturquette@baylibre.com, nuno.sa@analog.com,
  pavel@kernel.org, peng.fan@nxp.com, kernel@pengutronix.de, p.zabel@pengutronix.de,
  rafael@kernel.org, s.hauer@pengutronix.de, skhan@linuxfoundation.org, sboyd@kernel.org,
  ulfh@kernel.org, viresh.kumar@linaro.org, si.yanteng@linux.dev, arm-scmi@vger.kernel.org,
  imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
  linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
  linux-iio@vger.kernel.org, linux-pm@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sudeep.holla@kernel.org
Message-ID: <mhng-8AE63289-05A8-49D5-B38A-F5AA1D56C2E8@Palmers-Mini.rwc.dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_045232_313955_78522026 
X-CRM114-Status: GOOD (  52.54  )
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

On Fri, 10 Jul 2026 01:59:04 PDT (-0700), sudeep.holla@kernel.org wrote:
> On Fri, Jul 10, 2026 at 10:46:15AM +0200, Michal Simek wrote:
>>
>>
>> On 7/10/26 10:38, Sudeep Holla wrote:
>> > On Fri, Jul 10, 2026 at 09:42:09AM +0200, Michal Simek wrote:
>> > >
>> > >
>> > > On 7/10/26 09:35, Sudeep Holla wrote:
>> > > > On Fri, Jul 10, 2026 at 09:03:32AM +0200, Michal Simek wrote:
>> > > > >
>> > > > >
>> > > > > On 7/9/26 17:56, Cristian Marussi wrote:
>> > > > > > On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
>> > > > > > > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
>> > > > > > > SCMI server from different architectures than ARM that's why remove
>> > > > > > > ARM/ARM64 Kconfig dependency with also remove ARM from description and
>> > > > > > > rename folder to reflect it.
>> > > > > >
>> > > > > > While I understand dropping the dependency on ARM (I always wanted to do
>> > > > > > that and test if it worked at all on some otehr archs with QEMU), I am
>> > > > > > not sure about the whole renaming party ? why is needed just for
>> > > > > > cosmetic reasons ? it is at the end an arm originated protocol so I dont
>> > > > > > see it as a being wrong to be named as such even though used by other
>> > > > > > archs...I have not really strong opinion on this...
>> > > > >
>> > > > > I have been in CC on U-Boot RPMI patches which got to my attention because
>> > > > > I don't want to have another interface for MB-V(riscv-) running in
>> > > > > programmable logic and have another server in the system doing the same
>> > > > > thing.
>> > > > >
>> > > >
>> > > > Ah that's interesting. I wasn't aware of that. I still agree with the move
>> > > > in principle, but how does that align with these:
>> > > >
>> > > > drivers/clk/clk-rpmi.c
>> > > > drivers/irqchip/irq-riscv-rpmi-sysmsi.c
>> > > > include/linux/mailbox/riscv-rpmi-message.h
>> > > > drivers/mailbox/riscv-sbi-mpxy-mbox.c(Should be fine as it is just transport)
>> > >
>> > > I am having separate discussion on u-boot mailing list about RPMI and it's
>> > > usage on non riscv architectures because one raised argument was that it is
>> > > community driver spec compare to SCMI which is owned by ARM. But IMHO only
>> > > for riscv.
>> > >
>> >
>> > IIRC in LPC 2024, we did discuss opening up SCMI so that RISCV could use it as
>> > is instead of copying quite a lot from SCMI for RPMI in some closed groups.
>> >
>> > Here is the summary we got from couple of RISC-V vendors at the time:
>> > "
>> > RPMI is comparable to Arm SCMI, but it includes RISC-V-specific services such
>> > as HART State Management, CPPC, Management Mode, and RAS Agent. The SBI MPXY
>> > extension enables secure and non-secure system partitions to exchange RPMI
>> > messages, allows an M-mode RPMI transport to be shared with S-mode, and lets
>> > hypervisors virtualize RPMI for guests or VMs.
>> >
>> > RPMI development is already well advanced, with much of the client-driver work
>> > implemented in OpenSBI. Supervisor software can access selected RPMI services
>> > through SBI MPXY. A permissively licensed reference implementation, librpmi,
>> > is also available for platform vendors.
>> >
>> > RPMI was created after evaluating Arm SCMI, mainly to support RISC-V-specific
>> > requirements.
>> > "
>> >
>> > I didn't pursue it any further following some of these followup discussions
>> > post LPC 2024.
>>
>> interesting. It looks like that they even didn't try to ARM about it.
>>
>> >
>> > > >
>> > > > Now I feel we need some alignment before making $subject move.
>> > > >
>> > > > > Based on that we had discussed about it with Vincent and Souvik (we missed
>> > > > > you there) about using SCMI on non ARM platform and both of them didn't see
>> > > > > the concern to be marked as ARM only protocol.
>> > > > > Truth is that some of protocols have ARM in description, file names, etc but
>> > > > > some of them not. That's why I think it is good time to sync it up and
>> > > > > enable
>> > > > > running this protocol on other SOCs.
>> > > > >
>> > > > > > ... my concern really is ... wont this full scale rename simply generate
>> > > > > > a lot of un-needed churn for future fixes and/or backporting ?
>> > > > > I don't think it is going to be a big problem because it is just git mv
>> > > > > which git is able to gracefully handle.
>> > > > >
>> > > >
>> > > > Otherwise it may end up being unnecessary churn though I completely agree
>> > > > with the git/backporting aspects. Just don't want to churn things up until
>> > > > we have some plan and further changes/users of this move.
>> > >
>> > > As I wrote above AMD/Xilinx platform with SCMI server where ARM RPU/APUs
>> > > (with multiple VMs) and Microblaze-V in programmable logic acting as
>> > > separate agents is going to be the first user. And for being able to run
>> > > SCMI on Linux running on Microblaze-V I need enable SCMI on non ARM
>> > > architecture.
>> > >
>> >
>> > Ah OK, if the plan is to just use SCMI as is and having "ARM/arm" name is
>> > a blocker, then sure we can get that done. Hope you are aware of and already
>> > considered some of the RISC-V specifics listed above and ruled out any of
>> > those as concerns to use SCMI on RISC-V platforms.
>>
>> I know that we can't maintain SCMI and RPMI servers running on the same chip
>> doing the same things. We don't have space for it and make no sense to
>> duplicate testing on it too.
>>
>
> That is very valid and compelling reason to re-use and agree with your
> assessment. If you can make it work, go for it 😉.

Ya, it'd be great if we could stop duplicating specs in RISC-V land, 
it's just a big time sink.  So

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

if that helps any.

