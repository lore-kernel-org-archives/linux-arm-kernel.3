Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C6DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuShbMRKE0SZi3ijoimKFf4ervQLR1MwgbAPy6duExE=; b=gkX7lktohjSHtvqhRa6E//fBV7
	nq+aq5emMxYcZtnxys3E7PnbwfFINTnrtF/bme1UyjG53ZjC2vLeRFrOCB4XyH6WZmUM0Xp0TSVcR
	wOFzjgxdeFVm5PkIcZb3mlcTbnClfW5a0RDwp637ULI6hJsrY6aR8KJ7jy2CXAxda9jvkWFjav0n3
	R4ONw8wZQHek4Wio3y47s6dBWNc/P2lsqyKX66rtKsDH5CBC7lya6RwriQD1ZRcCVXBlmELvOkueJ
	h2+X9xogjeyp3b3PJiRMZDGd4udeKVk6uxH/jlMwhStXjHLh8MzXR979ZupSVxzRO1RCKmgu6rXXJ
	9qhA5t4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUmO-0000000HYdQ-43EQ;
	Wed, 08 Jul 2026 16:05:44 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUmM-0000000HYcC-0oVE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:05:43 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-80cbb0688c8so13302167b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 09:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783526740; cv=none;
        d=google.com; s=arc-20260327;
        b=bLl5DydbJJUQVMw6ZTWuOJsvd2y9T/0SDKxxW2bVLFDKSvPDDyMNZX9m4KcUsrmGtk
         YYBOQq3t3fWkIAltvKWLVwypKIlBYwwNbgO08pK4VUvwxTAa/abVYJV9G3VCd1/3Aa3/
         1DsZMmtc59I4ZmDRKfF9n672mZp4H1pGnu2bzy4bfvxuyglrFt6Hxz61TQbt0GChKpOh
         6iZpwEn9a+zeEmI6+a1ACQb5CCQoYkc8qHrNGkWPQqnE1tLLQXndgESZfiX+EIo9DOgl
         4arW3t7TJOBJdpI5Q23O4ay6aZZofaSRRFU1coXXRNX6fh34IJRTNJrF2+mlLbhtRx5K
         8BNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FuShbMRKE0SZi3ijoimKFf4ervQLR1MwgbAPy6duExE=;
        fh=GTYx8Vzv3y2KBZFZE8+CKyQ4in1dbYcG07jnIE6MALo=;
        b=jN2TcpFLARLIqvSGDRznUBzwlO9Wgdx0SZDNd9P6da+hZMjfDk6XGmq5VsAiwe8ThO
         /5fAj441Ydu9uGpF9SlGyqlkN9Mp5/d41sViSfBt03OalFbP4zhRKtW7maST9D6LGAgO
         0/WpXkZKAvTSkMZakQs4FR66hM1TBM5XYDBX1Oo2P4H7rT+p8faOdOBF/SU3hpuIJb5B
         ETVVHLBdnR6G7juaTGHzlvezLZSeQcrZbc8f5AWRqqKC+wzX+XvXdO4mfFAPxqgZLv5k
         Dvt8h85g4kouPbvsDX71o2SxdosT0hcZ8KyNNigRy+Jy5t/BHaolD3b5yRc9FeX6eXIx
         g/CQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783526740; x=1784131540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FuShbMRKE0SZi3ijoimKFf4ervQLR1MwgbAPy6duExE=;
        b=Eq6acJklqHREATDAo27xeTNWkbRKySl4GDQf2BI3FwFUD0ucNLX10SMBrrzV6MPzw7
         NI7RoiUmVymlf1WB8rzWPmehboslUBUOEBrj8ejmD+V/mkpab/sDkl6Oxsz2gjYsvKtZ
         jJ4bobr4h3P/WW+uc0ZkqVoOnG0bhFkiTjgUb++uXFJDx6NhdMT7V+koIu8yYfZLvqh7
         PBp6cTUSkvUfRoHQdAgsgC8gzPaxHtwS4uG5cg5SJcEWzHdmD9bhTjMNGLww4QQ0lNmD
         P+8QLEzMMmyCWsdHDsbRDfoSUD4G0qA6W3O/DNQWdlRHfMGb4DWEC1pxyDpMMtk7ihnk
         efGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526740; x=1784131540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuShbMRKE0SZi3ijoimKFf4ervQLR1MwgbAPy6duExE=;
        b=Ma+gSyNlXX7AzSP1Eu0+g8icUIQ6vcJVCAtcMdyNOrazZMmWwxmE4LhOkDNm7lQJsi
         SZvbJsjJZOGoGlFpFQEXi/II3SFIxKOUCpxr75xsog48Zv3MzpzOXDzLIYBgVUrEb7t8
         WHDmH+KenuU+lHB1WTzBj0ILaFpjC4feUGEXnfSML6AaMkB1cGEjuBBQfCkfOM+VSGc+
         7nw1hNgQVC/DNgKQjSjjyt/8baNbX7QTxkGdp+o3xiAOUxZxKfgbVdD9Rv/8a7ZvJIMk
         oQKP4PoFyS+4Kvv4JceUqhuk+Ih/QithceNU2L8+hio5PxdlNuAkGPZc1cSnDRzfcZdg
         0B2A==
X-Forwarded-Encrypted: i=1; AHgh+RqjLUDvWq5NTEvgMERX46GJoqZ4OygePIPv8LZjNIO19iATTnaVrfy7LifC4X5BIk7jn9k/6lriO3gSbU/Jp0f3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz90SVeNa0ESBp4Zfu9DDzJioc8IJkxfHPgmCaUVyJkc2gm8gNo
	8+TTofIgX4ljnxgA+biB5Gfi4MEtL0zC6tPgUWcJvdwYS3w7vCMkYuJlfqhrDGL1J8Vk8gfzHql
	bdtaKR5Ox3y4mG5wHEyah52BpfBkWomM=
X-Gm-Gg: AfdE7cmdzU574TaeRMT8XsTNUUe76qVQbnB0jN0SCLV6/cMQJ15le4HQIebwHA5FTIr
	0s1n6EK0JSbNv8RvJNQXtPSFJD4oB3UQ/748tWxxrf9zV8O1SpBN+lKt8ggoeFMJs09iI/m89sy
	YQ0+GzXm8IMMa+yfxB1J5aa7ST9e2pmykMxLiCTE8FacM9kKrVzYwwIBnzFjYBf5s6QfdB45OTK
	xiZsUlpPoF3n8pMw/z8YezJVYcycsK2tR5mjmz0d6m2GpIVnAaXMbS/4G8zE6FQsl0me3JR7Vzj
	eycLvhZE
X-Received: by 2002:a53:b117:0:b0:666:27de:9cb with SMTP id
 956f58d0204a3-6679f2042f6mr1904126d50.75.1783526740339; Wed, 08 Jul 2026
 09:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-d3cold-v5-5-89e9735b9df6@oss.qualcomm.com>
 <20260629211614.6942-1-threeway@gmail.com> <hzv6l3g7q55ofr6hu7y7indrn2uzc5kdvlbu3q7om44iw35nbb@5rc5uuhqbnid>
In-Reply-To: <hzv6l3g7q55ofr6hu7y7indrn2uzc5kdvlbu3q7om44iw35nbb@5rc5uuhqbnid>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Wed, 8 Jul 2026 11:05:27 -0500
X-Gm-Features: AVVi8CfNmJVMSvN9XdJeS7IaTnkgNSzIRTTUJaHWTxnojYvf0u8gwqelENm5DeQ
Message-ID: <CAOvMTZhpx57GGakfiS+1tz0t8XVPaydkaCONUxoPFdeXpv+xQA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] PCI: qcom: Add D3cold support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: krishna.chundru@oss.qualcomm.com, bhelgaas@google.com, 
	bjorn.andersson@oss.qualcomm.com, jingoohan1@gmail.com, jonathanh@nvidia.com, 
	kwilczynski@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, lpieralisi@kernel.org, robh@kernel.org, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_090542_238983_ED0DF072 
X-CRM114-Status: GOOD (  19.83  )
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

Hi Mani,

On Wed, Jul 8, 2026 at 2:53=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Mon, Jun 29, 2026 at 04:16:14PM -0500, Steev Klimaszewski wrote:
> > Hi Krishna, and Mani,
> >
> > Turns out, this patchset causes issues but only on some machines.  On a=
 WDK2023
> > (Volterra), this breaks suspend, and on *my* X13s, it also seems to whe=
n using
> > the command `sudo rtcwake -m freeze -s 300` when resuming it crashes th=
e
> > machine.  Interestingly, it does not crash on another user's X13s.
> >
> > Included is the info from Volterra's lspci -vvv and further down will b=
e my
> > lspci -vvv - my X13s has a WD_BLACK 2TB SN770M in it which is not what =
it came
> > with from Lenovo.
> >
>
> I tested suspend/resume on my x13s and it did not crash. So the differenc=
e seems
> to be with the SSDs. I did compare my lspci output and yours, but couldn'=
t spot
> anything obvious.
>
> Since NVMe devices do not support wakeup, the pcie-qcom driver should be
> transitioning the devices into D3Cold. But I'm not sure why the crash hap=
pens
> only with these SSDs.
>
> Since both devices have ASPM enabled, can you quickly try booting with
> 'pcie_aspm=3Doff' in cmdline and suspend?
>
> - Mani

With pcie_aspm=3Doff it still crashes on my X13s when resuming from suspend

