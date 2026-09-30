Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A1DCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQnxbzB0rX2uzsTz5BeJSh2mtO9nvpvZzzcrUYm1zTA=; b=cZ0cJ2JErrhoVCFWWSeqptHd94
	k2YqTfCIvYkkXSm8KM1lXWL1tBO9x/ja4Ke9ZCXupZk9UuropEPhnnu1vKlS2oCBktaHPV4f+ymgm
	AAhDSFySGQAQuGXYK/AWKQ4k8sgFCEbpljcoCeEz43I3PyqamlDELgpAnZr01rBC/QJ1XH0tsRCNQ
	DIbuALCMqrTxdM+MRHVgZNtW99qZhWMukxUBiysh9rYi1yzAw18P+mcadcjjYIFwhjt1tR2hUcp5y
	O6QWfmiA4T5kFLbz351rVDWaT0vrYvMKb6canc6cK47rrDzHg5Eyd+0Dz6D3ZkiVV4vswrw1EHft1
	4vjzpqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpum-00000005T5a-3BjJ;
	Wed, 30 Sep 2026 08:43:48 +0000
Received: from mail-wr2-x08.google.com ([2a00:1450:4864:30::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpuk-00000005T4l-18V3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:43:47 +0000
Received: by mail-wr2-x08.google.com with SMTP id ffacd0b85a97d-488795b6f69so2244515f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 01:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1790757824; x=1791362624; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jQnxbzB0rX2uzsTz5BeJSh2mtO9nvpvZzzcrUYm1zTA=;
        b=G9YzRt3XXWis1S74fcUoUG4A4nxSnEbLYh5mX/P584XEKH/fobt5SiXSgrDbpqVBEs
         oxajNZp3V8Z9keKQ0j5d89kCMGZtTq/l8uXRdQM44S1SAAUpy6orRlEiOLMmti4rpCot
         YtAOPG22kcnnW8XTzWvSmcHQ+jCD7yKW19zv/Nun8zclZtxd3RT3q+Kelm4q+b7564Yk
         EQirfSUX/ZlpdOvkmW+sSshbQ4ILbdbHKyRYUR2C+OFVsh8Yt9eiObqYG1ikjEYPdBqg
         Ly/ItCBOLmtbCqmP0T8qRZCVV4iH8P12YW6mBRdnzm1nIvkEXpz8Z3md9/16NxEKCoKR
         eOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757824; x=1791362624;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQnxbzB0rX2uzsTz5BeJSh2mtO9nvpvZzzcrUYm1zTA=;
        b=yHUkbqqCnb9k4f6mPZujt0rkxFykCXrrE9ugYIoirbb66ot8sDPUsqHy4QL95sAJp5
         eVFjDSvuUgWqkhYt6Q1htn6hdSkVblABoKzjIdLJWL4+t3p1t4RHQsQzeOUbQOngobja
         G/wUFrCcXeS2Hue/GeP88UTOqe0ifnhMMPfOEA1TjjrIDz2Kp3uyFb+Fd/g1Z10DDwVq
         u81vxYUDz8RwDf8VKYT6Xm7cWPF7snJvaU9x5ZV7nhAVHBvhG3NbK9/+fOEt9bwbMGNl
         t2w2YT8eLf1lVR87QNu410L7ZO3t3DlWyCEfT4DmhRpmkIVlpeh79z9zCRwI0lPrNK8t
         u1ag==
X-Forwarded-Encrypted: i=1; AKwUvBzgySHUa9LVd/+97GZ42L5ic1UTR07Pjy92fhzANk08r6o8vd3rdxaeO//qyPbicAAKqAriXEVk9nP7Blkt/Yxv@lists.infradead.org
X-Gm-Message-State: AFq9FYItNwC3LLYmymJ6yj1RySi7q8bzB1mgGVqtHjiFLU89met0axo3
	1yodB4FrhBv4WTn/FkzDYjRFIiF+YnO/zSSoj+ZwO9EHH5sDtxTJ1aEPHoyMrV8sjts=
X-Gm-Gg: AYBFou2EotH3Kx5UAAes3JE2R/d0qFvhggC8WajrFCJFVBi5fWvfUpQvTwByk0DYFU2
	ECDKGICmXbaRQ4uEJ6vIZNJk70KhTNEqgUbKXdC63D+Vn4zdh4xbuliXnTlqP/8lViGMZpKDxGf
	4iJ3pSeKRIthGKKCb/wV5BARpK3wuz4srAJ2p0Yum5uqGPOFzZ+Z1aLdQaidMvy1QKMRp3HMT+2
	OHL2UG3j3ZnX6iBM3WCy+A5Qddx+B5Oy/o1dE1MuZzWZ2zPC7phbA7IGCSrxZNEX7LR5Q9oGRAR
	gr7YQVUk6w2XXSFHEO04q7WLOn4n8qO3doA5dHryQZHo61sSUn+kTnMSg3Ivip/j06PNH8XQhN/
	NLxEgIWwDHorwmSbGtA4eZWb7XIJ542Hk/niw8v65d+tC9QH4frrhb1ikYcsjjjcCtl79ZQ0t4y
	/pRrhBmjjtGBwoKqpoisIu7+qefiYmkDIDlzYiEC4j/424XIICFO6GOYpO/G5ENm1Xlb6q/zPjM
	zCge00G119FBPdmwRCNi7rnkzdvuuKiq+WrNfAjAaY9Ec4nrTGf1So3XOV4IRo5btFEVZ8=
X-Received: by 2002:a05:6000:25c3:b0:487:10a9:57cb with SMTP id ffacd0b85a97d-48b0253e9eemr1543524f8f.49.1790757824401;
        Wed, 30 Sep 2026 01:43:44 -0700 (PDT)
Received: from localhost.localdomain ([217.146.93.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b0dsm1702201f8f.25.2026.09.30.01.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:43:43 -0700 (PDT)
From: Salil Mehta <salil.mehta@opnsrc.net>
To: Bradley Morgan <brads@mainlining.org>
Cc: catalin.marinas@arm.com,
	corbet@lwn.net,
	gshan@redhat.com,
	james.morse@arm.com,
	jic23@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	ruanjinjie@huawei.com,
	tglx@kernel.org,
	will@kernel.org
Subject: Re: [RFC PATCH 1/2] cpu/hotplug: Skip disabled CPUs in cpuhp_smt_enable
Date: Wed, 30 Sep 2026 08:42:46 +0000
Message-Id: <20260930084246.3238477-1-salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <133D63B7-B1DF-4DEB-92F6-B6D785D43457@mainlining.org>
References: <133D63B7-B1DF-4DEB-92F6-B6D785D43457@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_014346_359011_84BFBEB6 
X-CRM114-Status: GOOD (  29.79  )
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

[Sincere Apologies, sending it again as Plain Text; earlier reply got
filtered perhaps due to HTML content]

Hi Bradley,

Many thanks for taking a look.


On Tue, Sep 29, 2026 at 9:16 PM Bradley Morgan <brads@mainlining.org> wrote:
>
> On 29 September 2026 20:41:29 BST, salil.mehta@opnsrc.net wrote:
> >From: Salil Mehta <salil.mehta@opnsrc.net>
> >
> >The CPU enabled mask describes whether a present CPU may currently be
> >brought online. cpuhp_smt_enable() is an online operation, but currently
> >walks all present CPUs and only filters CPUs that are already online or
> >belong to offline NUMA nodes.
> >
> >This can make it attempt _cpu_up() for a present CPU which firmware has
> >not enabled and which has not yet been registered as a CPU device.
> >
> >Use the enabled mask for the policy decision it was introduced to
> >represent. This keeps present-but-disabled CPUs out of the SMT bring-up
> >path while still allowing registered offline SMT threads to be brought
> >back online.
> >
> >Present and enabled are separate generic CPU states, so callers which
> >intend to bring CPUs online should not assume that every present CPU is
> >enabled.
>
> Ok.
>
> >
> >Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
> >---
> > kernel/cpu.c | 5 +++--
> > 1 file changed, 3 insertions(+), 2 deletions(-)
> >
> >diff --git a/kernel/cpu.c b/kernel/cpu.c
> >index b3c8553d7bd6..988b7a1e8298 100644
> >--- a/kernel/cpu.c
> >+++ b/kernel/cpu.c
> >@@ -2706,8 +2706,9 @@ int cpuhp_smt_enable(void)
> >       cpu_maps_update_begin();
> >       cpu_smt_control = CPU_SMT_ENABLED;
> >       for_each_present_cpu(cpu) {
> >-              /* Skip online CPUs and CPUs on offline nodes */
> >-              if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
> >+              /* Skip online/disabled CPUs and CPUs on offline nodes */
> >+              if (cpu_online(cpu) || !cpu_enabled(cpu) ||
> >+                  !node_online(cpu_to_node(cpu)))
>
> Ehh, have you had a issue with this code? Like something e.g: a splat.

No, I am not reporting a new splat or crash on current upstream. This RFC
is a proactive polite enquiry about the design choice, together with a
proposed alternative. If you check the the cover letter it provides the
context, including reproduction of the original warning with the earlier
present-mask semantics restored and the results with the proposed fix.

Just for the context, there is also an outstanding QEMU Arm vCPU hotplug
series awaiting upstream acceptance. The distinction between a CPU being
present and being enabled has been an important part of the model we have
been explaining to the QEMU community. Changing those semantics now could
complicate that work by changing the assumptions on which the interface
and its explanation have been based.

The underlying CPU architectural requirement remains that all resources
associated with the possible vCPUs are described at boot; virtual CPU
hotplug does not dynamically add or remove those resources. The patch in
contention is not changing that assumption even now but are we changing
the contract between the ACPI and the kernel or misrepresenting what has
been discovered already?

My understanding from the earlier design discussions related to support
of the vCPU Hotplug on ARM was that toggling the present mask to represent
firmware enablement was considered and ultimately rejected. The intention
was to keep the kernel’s representation consistent with the ACPI/firmware
model: a CPU can remain present while firmware controls whether it is
enabled. The separate cpu_enabled_mask was introduced to represent that
distinction.

My concern is therefore about the compatibility implications of changing
this established, userspace-visible meaning. I cannot currently point to
a specific upper-layer consumer that breaks, but neither is it
straightforward to establish that no consumers depend on it.

Catalin also initially raised the possibility of breaking other things by
no longer marking these CPUs present in the discussion of Jinjie’s
original patch, although he subsequently proposed a present-mask change
himself:

https://lore.kernel.org/lkml/aeNxKpHzTQX4_kId@arm.com/

What I would like to understand is why changing the present-mask semantics
is preferable to using the existing enabled mask in cpuhp_smt_enable().
To me, checking eligibility at this caller appears to address the original
warning more directly while preserving the present/enabled distinction.

However, I may be missing a deeper constraint or a trade-off discussed
while I was away from this work. That is why I posted this as an RFC, and
I would appreciate understanding the reasoning.

Hope this explanation helps.

Many thanks,
Salil.

