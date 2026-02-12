Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C853AEEA850
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 21:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DEi6lE69DtAre9+98et1Td5y86Gv96d2+RPCeTq+27M=; b=1hrq4VzeHfjjZu
	HoxScQvBAr+6bA/CRjVRs6eAJwKj3khn2/r3ZZkjI2oBeJoo9W63xSro40JUynC6csuyZRGKnbi1F
	P1pfLKkSThLeFHs+oSt+Vcwgq1LJ1aHb7YsslqapfzG4Q0v6tuaa971ayWL6lHgxuyG1LyPGm7/jI
	wRf5SvJh5z9y4kYbQsrjLeKBBGgqlc7XTuHo8TeW68ar+hlI7k5eN0bDBgwrBLDecnrMd7q7EXjQu
	gpc40g9QIoOkdoGmVJDhxNr1gAMNbausm3Z8NbfhUPXLyxW4uFUlPq/WgV7BydFC+y8DaNWjpsRsq
	HF76UCXP45modDSSoosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqdvW-00000002dQ8-2P0F;
	Thu, 12 Feb 2026 21:08:42 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqdvT-00000002dPm-2mRh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 21:08:41 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7d42e248b0bso1602089a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 13:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770930518; x=1771535318; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DEi6lE69DtAre9+98et1Td5y86Gv96d2+RPCeTq+27M=;
        b=2T8J3dQfoLqAPv6fSTZWvOpR2Y9b1Yr+WMHy7CBRcpA6Drvx01vjIiSXskecXdLNl4
         GMpyRG8FjXkn4VzlYRCpGWpjU8l+POSyIhP9CA4XbMQ3AiS5diQg7VE4njJwtzuG4VJ8
         HbO2nwY8unYYvPWoGoiK55IhR8nIfLt2ShinBZKAjwgK4PGt44d/TDDNplB76fDr+ioe
         jR1ebHVj8Rw+YJHt3c4flmQsq03Ft8TGlxM74/OkuWWVdx4QsFW4pzs8hHdXhh22tTsn
         4W0JXrqt5qRnfSRPqzkUE2zBNMvp0Pe/tCWghSLf7SVel74g2mGaUBu3ZeSMHwru5H2K
         CicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770930518; x=1771535318;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEi6lE69DtAre9+98et1Td5y86Gv96d2+RPCeTq+27M=;
        b=Kd/Bc+w9+jBOP99JMXZZnt0Zk4wS0GcbgV7WRkZlbGqISDf/bqbRifvJaJa+N1Fh47
         fNSFUlbEqETL6Tx8zqO0lPjO86vQs3cG+VVCVnWZO4o4SQvCilVwSqPmZDUbi6A//dq2
         ERqaNYK2DwSAzxRINqq3pWnmQq0Kd9qKbb9i16Y2/clld4bKCGPPfXlja3NummbO+n2x
         3mr6OwjDl5CQwI8h0Vp5Dj3ogF0XsgKJ4cK6KI1V2pwcZC2OV3Tc0ftV0d2xBqFG8Ft5
         zs2aj/t8FSlLKO3MXn63qJIuqYKHGZLZt1nKVb/emkr/QuHx9nNX/ODRQj1SJPPrI4U2
         Q+rw==
X-Forwarded-Encrypted: i=1; AJvYcCWcSvoiVG44fhwN7gxNKkB+PEDPFjRrTo7rPHn9UxXm5ZNgieCrZTWEjXwz8kwPpAW9rcCjyvaEnHmzviq0EpnK@lists.infradead.org
X-Gm-Message-State: AOJu0YzJFG2tsa6C/ELyrVrk3UupSj/dH3cSbxLGwWrWc8vG83D29+ai
	O/GWH7PWLExrLrRJfwPdcM6Bd5F6AhlXjgcZhi2wgS8YQBaJ2QMvDHa0isK+skjfCJNb67s991n
	+Df5e+hoOFcpka8kSwPe4jpVDZg==
X-Received: from ilmv6.prod.google.com ([2002:a92:c6c6:0:b0:468:4e21:6fcf])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:61d:b0:663:2b12:14f1 with SMTP id 006d021491bc7-677243b521amr65721eaf.83.1770930517469;
 Thu, 12 Feb 2026 13:08:37 -0800 (PST)
Date: Thu, 12 Feb 2026 21:08:36 +0000
In-Reply-To: <86v7g5asp4.wl-maz@kernel.org> (message from Marc Zyngier on Tue,
 10 Feb 2026 08:49:59 +0000)
Mime-Version: 1.0
Message-ID: <gsnt8qcxhdpn.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v6 00/19] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_130839_756513_7A4E181C 
X-CRM114-Status: GOOD (  16.32  )
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

Hey Marc, thanks for the review.

Marc Zyngier <maz@kernel.org> writes:

> On Mon, 09 Feb 2026 22:13:55 +0000,
> Colton Lewis <coltonlewis@google.com> wrote:

>> This series creates a new PMU scheme on ARM, a partitioned PMU that
>> allows reserving a subset of counters for more direct guest access,
>> significantly reducing overhead. More details, including performance
>> benchmarks, can be read in the v1 cover letter linked below.

>> An overview of what this series accomplishes was presented at KVM
>> Forum 2025. Slides [1] and video [2] are linked below.

>> IMPORTANT: This iteration does not yet implement the dynamic counter
>> reservation approach suggested by Will Deacon in January [3]. I am
>> working on it, but wanted to send this version first to keep momentum
>> going and ensure I've addressed all issues besides that.

> [...]

> As I have asked before, this is missing an example of how userspace is
> going to use this. Without it, it is impossible to correctly review
> this series.

> Please consider this as a blocker.

Understood. I remember you asking for a QEMU patch specifically.

I had hoped that the use in the selftest was sufficient to show how to
use the uAPI. If not, I can send out an example QEMU patch to the QEMU
ARM mailing list.

> Thanks,

> 	M.

> --
> Without deviation from the norm, progress is not possible.

