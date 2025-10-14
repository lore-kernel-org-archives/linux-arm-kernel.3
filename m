Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2323CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cvKIarSkBijJe+UuuzaIt5vygtV6rMdWJ+oHNw2EJI=; b=YLj3ky7VNJan49u1XB9SlivCJA
	i9pIY7Wuf6Q/EarjCY801cUg2G7ftfzeREHWcvLsZVkOsx3espWzwiImVpANl7aA/kOz1XxlEia++
	oGIVWUTNOHHi508fA8CwJK5mLggXhjztpVt/GjgB974W5ivzt0QprCiTWxnaIA19dxgQWmmDLb25e
	C6acGMOnVWFdCYjurphsqBW+UfmdIVXM/tWWBXd4FCVMyrzrXaB0nkxFoFFcaq/dGtdgst+lLV0Qv
	KccKOpjYa6UF9oTvaeDqjdPC+l+hgBw3Sn3pyOkqQ7byyYXvGSxhsM+6m7bFlS59AdeNN1Pi2lHGQ
	/BLvcZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bNg-0000000FlLX-1nWt;
	Tue, 14 Oct 2025 09:31:44 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bNc-0000000FlL8-46qM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 09:31:42 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-73f20120601so49283057b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 02:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760434299; x=1761039099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cvKIarSkBijJe+UuuzaIt5vygtV6rMdWJ+oHNw2EJI=;
        b=P62AsDsEwtBtCC/Qttl9LAw6MresvZGnhZJgcAa/aLQ1A0Xl/FezgfjeK8f6h9sJE1
         RSbKsYiSmj0OzFDaSDPwRtJRBfnMKpJFcg/yn4r8KARSEbNvLMNE38Lb/udfs4cbLZrd
         F3SJjtuyZNuVdX/7zX72KlLNv06yEtkmYP6qbntifKD6dZvv9iWVghdhxz7pEiWeqZJV
         hhMWX7aqY/u2KiPcEHw1sWNu03LxSnXaBBBQ/g1RG/e6lkBdJUH4heDsw8uMfvNOfpxa
         ksF7CC1gdD14+zmT93agp5sehCjxquWDOxp8hm4qnliFARcaUgodrgyA/SPP5jH+/eGV
         HiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760434299; x=1761039099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cvKIarSkBijJe+UuuzaIt5vygtV6rMdWJ+oHNw2EJI=;
        b=tUyeEYTFV0JPNQhn/covkORCbAyT6rfjabHfQyLEw0wPPBka05poZNnVIQEtdMpQcd
         JgKgtBxswJLFTTEpwi/naTdXt0mHVPfVGwE7ecqR9GGU1/NWegF8UxsTs+Y6rG0iuhC9
         MXx/C3PiWDMOU9Aundzm6b8alTJjYSIVtq+PzIgLK8zbGif/EBMX0FzfPhpbdgSkOHXf
         +wbiGGTICxYIH+r7cZBGhYTq5JAWBoetvbf4V2adZ/oTrAcAVaca/i9vNbE04B9P5zah
         JLu10xNcLZqz+aukLTWglTMkVoebWD8SHvrv1RDcgIVFrTOXQdqa4HTWLpN6nD5XVp4d
         jweQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRY+ADM2yFgDXQMwOpRUBjcbTeQ3YBHFFCADHIFyH0prpuqht+eDhHGPckZt1GJUFPMz20GZcghSul4AH5tph4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/gXFE83YZZtVrLfM8g52/sxDXBwzePQpEGCyeIjbhpbOmdCak
	axouP3S+x0yF+ZmdOeFiCpvTqsD8tXY9dDyye0LCHVKnznjLoklGZgDRP2Y/1Jnr5THQ3IHPnS6
	dKMmv1YZFYAkS5Qzd7iv59bYspAGJrCFxTbsuJzfCMg==
X-Gm-Gg: ASbGncuyBuZlU3uSxgIz4Y85zdxeZqPYkXXV7SBq7XW8vdgMDz9k6HQD062QWrOq/Gv
	89Ge8yZuILSd3337Z3DGftozl63LHU0ROQy4wXtGFdIzhfh5uYIu3M2jpJuW8QQkTy7lpgJrROP
	G92KWVTGYQBQ4Io1cjYg4Ti0R6EQqaWvVzxY2gV5IANZVFPFobhvXnbWbxcDebsdCWrt9nwqOH+
	oVTFb5oEQ+fG9U2te10vAlYYSiH6f0=
X-Google-Smtp-Source: AGHT+IGpfT1cl8woYMQjpU4Hfvq9tR+YuLgZGpBnk++5ZO2YaY91O5P1sxo8/L5tsI4hAc1GBqgPgrvYoCRQYmV9EAA=
X-Received: by 2002:a53:a146:0:b0:630:e716:e358 with SMTP id
 956f58d0204a3-63ccb854dd7mr15136764d50.14.1760434299398; Tue, 14 Oct 2025
 02:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251008201955.3919537-1-salil.mehta@opnsrc.net>
 <86v7koxk1z.wl-maz@kernel.org> <CAFEAcA8=yhQ-ygoA-fqxzwg69OkdW2nBM0O9X3Lmww4eXuVMWA@mail.gmail.com>
 <867bwzxe9r.wl-maz@kernel.org> <CAFEAcA8FhgcaM_OsHKB3+3Z7B_oZJqU4LHX_j9p-ZQrHfWGX7g@mail.gmail.com>
 <CAJ7pxebGOj5Z1iW6VPjzj73eY1hZFjS5uXMkee8XCm09DtFcKQ@mail.gmail.com>
In-Reply-To: <CAJ7pxebGOj5Z1iW6VPjzj73eY1hZFjS5uXMkee8XCm09DtFcKQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Oct 2025 10:31:28 +0100
X-Gm-Features: AS18NWAJX94qy4FaMKCiJ2t5Jr7n_3WauLvwbqWyfMVGv2EBw5_zyhfXEJWTZIA
Message-ID: <CAFEAcA8VL4wE2w9PegPD_AVSKCZzzzx-jFru7dDOq4Tz5xs76A@mail.gmail.com>
Subject: Re: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow
 lockless read when ready
To: Salil Mehta <salil.mehta@opnsrc.net>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, salil.mehta@huawei.com, 
	jonathan.cameron@huawei.com, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, james.morse@arm.com, sudeep.holla@arm.com, 
	lpieralisi@kernel.org, jean-philippe@linaro.org, tglx@linutronix.de, 
	oliver.upton@linux.dev, richard.henderson@linaro.org, andrew.jones@linux.dev, 
	mst@redhat.com, david@redhat.com, philmd@linaro.org, ardb@kernel.org, 
	borntraeger@linux.ibm.com, alex.bennee@linaro.org, gustavo.romero@linaro.org, 
	npiggin@gmail.com, linux@armlinux.org.uk, karl.heubaum@oracle.com, 
	miguel.luis@oracle.com, darren@os.amperecomputing.com, 
	ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com, 
	gankulkarni@os.amperecomputing.com, wangyanan55@huawei.com, 
	wangzhou1@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_023141_047472_08C1466A 
X-CRM114-Status: GOOD (  22.83  )
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

On Tue, 14 Oct 2025 at 04:02, Salil Mehta <salil.mehta@opnsrc.net> wrote:
> On Mon, Oct 13, 2025 at 4:48=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> > That said, QEMU's current code for this could be refactored
> > to avoid the reset-time read of ICC_CTLR_EL1 from the kernel.
> > We do this so we can set the userspace struct field for this
> > register to the right value. But we could ask the kernel for
> > that value once on VM startup since it's not going to change mid-run.
> >
> > That would bring ICC_CTLR_EL1 into line with the other cpuif
> > registers, where QEMU assumes it knows what the kernel's
> > reset value of them is (mostly "0") and doesn't bother to ask.
> > This is different from how we handle ONE_REG sysregs, where
> > I'm pretty sure we do ask the kernel the value of all of them
> > on a vcpu reset. (And then write the values back again, which
> > is a bit silly but nobody's ever said it was a performance
> > problem for them :-))
>
>
> This is effectively what the mentioned patch in the commit-log is doing.
> Pasting here again:
>
> https://lore.kernel.org/qemu-devel/20251001010127.3092631-22-salil.mehta@=
opnsrc.net/

No, that is not what I have in mind. What I mean is that
we can just read the ICC_CTLR_EL1 value once on startup
(in our realize method, I think) and then use that value in
reset. That should not require any of that machinery to pause
the VM and keep retrying.

-- PMM

