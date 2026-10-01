Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342AECA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIbawXPVSEHJ0DscG76tmh9vZXpkAHRdIDz4TIVMzco=; b=5G6E13Az2gyNhgg7wfrM5Kl94v
	ULmuFjmO3+kO2N+F7lLJDOSykLXhR0KmFbPCMT7hVPCjZOCgQs2VpBfsn0lYafRM2Pc/heUfPr0/+
	uSn6BxuigHPBGPQrCA25LSDjL5YLYZCQaxzFVtPGE/Sn7nMW0EPD7w/1/mhFSP1ZZj7HPuryg3yf8
	qmLFFGn2Y2uscLIf0XsulTq6bWrlH7l+sTo0AbV5WKbwJMlAAZXrFsk59hJDTxTsal/xDc578kzgv
	sSi6CEGQoCzzntwFjzaafQa5nFX9lE5LEackswYY0++B62Tg6Q+l7em22JzS/PvAEw9kEiMCYcVVH
	YdZafWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOPp-0000000AHDu-3xUo;
	Thu, 01 Oct 2026 21:34:09 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOPn-0000000AHBs-0LQW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:34:08 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4b37620eb73so12524432b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790890440; x=1791495240; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIbawXPVSEHJ0DscG76tmh9vZXpkAHRdIDz4TIVMzco=;
        b=UOhNWvCyfpgnxkJU2OCWW93aKwzkCvuZwA56RMQk05IDd2rIkDExyL7NPmR3QZNkqT
         pkYgINKz+T0nIu3Mn/1ycAuzncx9Mu50Sr+tkWDVMsiMjLan7JyFtCqb9cMK6i5Zhu28
         KZ9wtHwNAjEmXgnHTuM5K/iVdLnOcslY0QaUb4rHpwZQpcHEvR0qpLLmzZzOhXf2+NhF
         a1DqUgbjPnXJ6aW4eatyfDsnhGyi3kj9E26Sm0Tf2cOFVWA5qbWMgDcL+hujyxZcAgmr
         C6UG2xvWck6fTTKd+AO2icroRDHoVV9E1hY3r4MnC4amJ+ohq2GvXEQEAsF4pAXeeXYL
         3Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890440; x=1791495240;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIbawXPVSEHJ0DscG76tmh9vZXpkAHRdIDz4TIVMzco=;
        b=KSz94MPbg7LKtVPzy8/XGfR1dBxp44dUbk/LlSyBdYj7+i7734Ma6JS4eB1kEepG7u
         RxL4oEpZnrEgAVHa19j9DANqd5R9Dczh6qaqASKi0cPzQkxREFolRc0icb0Rw2uV4uQw
         8ED+NbA9IvZmOjXBTHfVmeBMS1q79P67ZS955BjNjbqftA9b/XhbV3VgdrGNpbNsyAXv
         NiZBrRDkTD5vMz+vyoUlUZrIy0lEfZqU6NL9LGD+QIpeijc0QncK2Gw6HC0FBQ8ApT4E
         itfmQ+IMMR+NYR4qM+ATieK2eNsIYG03nw1d8f65+wLivXiteHRwOh1hvePbjqIPGmpG
         Pz4A==
X-Forwarded-Encrypted: i=1; AKwUvBxB5LGKJrAtlfKgZdS7724oWU0q+rR8kOsgeopBoBb/5wvltdK3S+Afc1YGzJzH/eX2jAgyHPpBp8FdJFOg7kEx@lists.infradead.org
X-Gm-Message-State: AFuF++nI7317/svAICtR0WgdL0/Q3hMWY4k1r9u687j6oDoJXul98UbY
	t/wnd+Bi/L/XV1YuFRDa5Oa7KqJW3Y21wd2d4CKNcW+IXqQzuAjLtllBtnzRUZqaXQ1WBszP+2b
	0m8eY+WwSq9cMkT8JH/8KSdF7Lw==
X-Received: from ilbby7.prod.google.com ([2002:a05:6e02:2607:b0:50f:46b5:b429])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2219:b0:4e6:6079:c33d with SMTP id 5614622812f47-4f5292ffc0amr467127b6e.10.1790890439463;
 Thu, 01 Oct 2026 14:33:59 -0700 (PDT)
Date: Thu,  1 Oct 2026 21:33:57 +0000
In-Reply-To: <f54b9ea6-48b1-4f6c-92cc-b0a9249c2fb0@linaro.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
 <20260924172928.2110956-17-coltonlewis@google.com> <f54b9ea6-48b1-4f6c-92cc-b0a9249c2fb0@linaro.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001213357.2088894-3-coltonlewis@google.com>
Subject: Re: [PATCH v9 16/22] KVM: arm64: Apply dynamic guest counter reservations
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Zide Chen <zide.chen@intel.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_143407_537183_1291C545 
X-CRM114-Status: GOOD (  25.62  )
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

Hi James,

On Wed, Sep 30, 2026 at 04:28:37PM +0100, James Clark wrote:
> If you enable pseudo-NMIs, watchdog_hardlockup_enable() installs the
> watchdog using a pinned PMU event. If host userspace also has a pinned event
> on the mandatory 1 PMU counter assigned to the host, then a guest could
> potentially squeeze out the watchdog.
>
> I'm wondering if we need to prioritise kernel owned events? Or we just treat
> them the same as any other event, and with PMU partitioning assume they
> can't be guaranteed to be running? I feel like you would expect a watchdog
> to be a bit more than best effort though, especially if there was always a
> guaranteed counter available to put it on.
>
> I didn't follow it through completely, but it also looks like if the event
> gets squeezed it would enter an error state and then never be re-enabled,
> even after the guest stops running.
>
> Note, that I think the current ordering means that the watchdog won't
> actually get squeezed out because it's created first. But I don't think we
> can rely on the ordering as a strong guarantee, and it might get broken by
> refactoring in the future.

Good catch. Even without future refactoring, creation order can be
defeated today if /proc/sys/kernel/nmi_watchdog is toggled off and back
on at runtime while a userspace per-CPU pinned event is already open,
giving the re-created watchdog a higher group_index and causing
merge_sched_in() to put it into PERF_EVENT_STATE_ERROR when a
partitioned guest takes PMCCNTR_EL0.

Prioritizing kernel-owned events (!event->owner) ahead of userspace
events in perf_event_groups_cmp() and perf_less_group_idx() guarantees
that a kernel-pinned watchdog always wins the mandatory host counter
over userspace pinned events regardless of creation order. I will look
into adding that for v10.

Thanks,
Colton

