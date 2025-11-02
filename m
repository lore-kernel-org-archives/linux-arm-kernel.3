Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3975CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eQOuzyVymqrjJN7nLk0xcoaAwNBEOp8HsZ+4tadSh8=; b=FaJit7O/3Fh7V4BbUDu3x0QEjn
	KtquPQNzbKDkjFH6nE+tMbHVBHi01qN3L1WhuGn7ZaqfQn+8+WJm3YV2pgDsSxuZTdI26szysGUX5
	AOxLUXJzsilrzQHWTKCwL/bWlPc55FNgTDKBBnXKAGdL9xKKr7RrWk5/keWquRTdDdbwDfQrqO0/k
	kavbWAm2f9s5/7U4/iKesJ2/0FiJ7wQh7b+v/ebqN3+X51GhR8x6+vjjmVWBkQotQmhn3hTFNhafn
	7MhVd+uDA7KGWqRoBi8oK4S+qPstRQsD8LlCgq7YQS87GtWeU66KKSFG3bbXYHB3t86t89rO/Co0+
	Qfe9ol5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFcDM-00000008i7w-1nJW;
	Sun, 02 Nov 2025 17:50:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFcDK-00000008i7X-19wG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 17:50:03 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2959197b68eso119135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 09:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762105801; x=1762710601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eQOuzyVymqrjJN7nLk0xcoaAwNBEOp8HsZ+4tadSh8=;
        b=lMNy+DHjX9JRcU0x49c1tTO8MV3iG8EPydFCYlzicshk7bNnlevintp05ddaIU4DRJ
         un3qVgoPPB88zu13ff6ToCwLcDIltCzQACIsWqX34UwurgzAsO/Nsc5fJZC8yTg63Ii4
         VuPCbIXWWOIEsfQLP83+POzc9bbqbJuJJPzVRJEtVG3EZBqSVnU9N7hpeBrIbA32KlmC
         Yth5MMMWWuSUrBLiIEc5+AhPeXOspg862lGbDCevVmKdBsy/fJhMhNCuXHJY3W6/lPey
         pmIdfR2v6XVNF/S7iTvxtAfGdneDy76pftrhP38U5ZLx/LV7VNXbh8YhSw1S2+1eiVdI
         S5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762105801; x=1762710601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eQOuzyVymqrjJN7nLk0xcoaAwNBEOp8HsZ+4tadSh8=;
        b=KGBqFlgORThAmyURVsZjQbe1gt4ItgQ+H9DWweBpXU+R9Isl0vG/MDbE3Gr43YUnH9
         1fNqYfs0VmwVdDrR+/hh4JtoBWWSlCOQiGcyDr7THdYm/GPUnzwmyfXrfiP0mECBFdN9
         qQvdexFkWPP7PvEk5+HlvbLf4geXPfdhB2zIo+mfGbXM1BdLNCzhBDrbbUMT3G2NG6CD
         2BCABYYMgnle6WhIPh43WQcfqDwJv3YvPCG1fgEBTUi/MePMr4YlQO/Jys5YwoC3Rp0H
         EVpzqHmxnlsojmmtOz1G60aP/VUbfGA9GFGa8KCsbdp247HTfsQaE/2zNEKRMHq9+N9Z
         hSFg==
X-Forwarded-Encrypted: i=1; AJvYcCVpFrFiJSK5pq0yaGXnDkVXnn2ddw8gDLF53Ae+YPFapcTAuz67V7uOGepT7JoBw9J/nGksWR5g/At710/1szuL@lists.infradead.org
X-Gm-Message-State: AOJu0YwqLhy4rNrSNTNspJ6ddAL1u4u4CzEABw3bjaucAof3CnmMbP/r
	VPRgDO7Q8RBtZZ0o3gHRcSz1HA0zCma8H7tVef0ew5mg3gLeWUU2Zxci5b4+ujN04Q4ctZEovaL
	DAILZIEvhgta80Z8hK/x7VqhTD/SKoKntNgFPBJpu
X-Gm-Gg: ASbGnctjiDlDmBwVffghEkKs7Fuu1uKOBnrni49x50TxS5w/9xq9ADM/0RzcIim4wLB
	vnlqVVuX6lfYqLfmXpO4I0DK8sNd5fsmOgD/MeXoB4wrPp2OEO2gjbYNVdZAn+ucxX56O23fNPC
	apXT9mPmlTnzYvWoq5geljkHuU5pKp2JPK8nO5XGtxdsiZqyFf1BEuRN7qFCPttOD5cdFHlcDRP
	m/6urc/1v68wy15EQw2Pf/RqtrhJ7odY3Bl67VLzOsey6vfOiGePe7yoVl4VXIgjWsfqLhHpJwT
	cIyQHcs7YQAlcueooQo=
X-Google-Smtp-Source: AGHT+IEAICGtm6NZwDsByzAJ38ijLdVal4l1vq6PUUUbo88S4qCmpEjKeMXQGMqibYfiyxUc7Vr67BHJv3oovdCQ47I=
X-Received: by 2002:a17:902:cec3:b0:265:e66:6c10 with SMTP id
 d9443c01a7336-29554acb52dmr5165755ad.4.1762105801057; Sun, 02 Nov 2025
 09:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-4-yang@os.amperecomputing.com> <f24b9032-0ec9-47b1-8b95-c0eeac7a31c5@roeck-us.net>
 <933a2eff-1e06-451e-9994-757d66f4b985@arm.com> <bee6b93d-aa2e-4335-9801-89f02eb3eccc@arm.com>
In-Reply-To: <bee6b93d-aa2e-4335-9801-89f02eb3eccc@arm.com>
From: Guenter Roeck <groeck@google.com>
Date: Sun, 2 Nov 2025 09:49:50 -0800
X-Gm-Features: AWmQ_bltYJ86Q3HtfXxhBr-_kg1IjduAALHrq3mVP45Prvfz_NGkLOMlSeQlc50
Message-ID: <CABXOdTeOU0qeSicdDU6DjNHWpzCEhK-66kTdwWjb3M+=Xr3aMQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] arm64: mm: support large block mapping when rodata=full
To: Ryan Roberts <linux@roeck-us.net>
Cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com, 
	ardb@kernel.org, dev.jain@arm.com, scott@os.amperecomputing.com, 
	cl@gentwo.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_095002_319867_D5278227 
X-CRM114-Status: GOOD (  13.85  )
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

On Sun, Nov 2, 2025 at 7:09=E2=80=AFAM Ryan Roberts <linux@roeck-us.net> wr=
ote:
...
> commit 602ec2db74e5abfb058bd03934475ead8558eb72
> Author: Ryan Roberts <ryan.roberts@arm.com>
> Date:   Sun Nov 2 11:45:18 2025 +0000
>
>     arm64: mm: Don't attempt to split known pte-mapped regions
>
>     It has been reported that split_kernel_leaf_mapping() is trying to sl=
eep
>     in non-sleepable context. It does this when acquiring the
>     pgtable_split_lock mutex, when either CONFIG_DEBUG_ALLOC or
>     CONFIG_KFENCE are enabled, which change linear map permissions within
>     softirq context during memory allocation and/or freeing.
>
>     But it turns out that the memory for which these features may attempt=
 to
>     modify the permissions is always mapped by pte, so there is no need t=
o
>     attempt to split the mapping. So let's exit early in these cases and
>     avoid attempting to take the mutex.
>
>     Closes: https://lore.kernel.org/all/f24b9032-0ec9-47b1-8b95-c0eeac7a3=
1c5@roeck-us.net/
>     Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rod=
ata=3Dfull")
>     Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Tested-by: Guenter Roeck <groeck@google.com>

Thanks a lot for the quick turnaround!

Guenter

