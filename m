Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1CFC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pgrlp+kanKdNoXJ+vKvKqsAcIb9YRQaef/KFSYsD/eY=; b=CdH8xp+oM07qhf48P2vJvrrUBj
	HFAIPN3HehkJai+kTGahVaprGUSTb6ioV3HomfKgQEoT06IpDh6WMl4YTYxjDuhFfs+8jU9pz3KD5
	dOLXQn/zzry+eEk8lDjDwycIXoI80lwqiD5/yaGil30f49wFzmcl+9HYSYdTjHfRujr2IDFzDdiNf
	YYzVw30NMmazsvKRxAjVI1LdWG69FpyFhyMouMMTV7KyuhRaylDT+xQv/dQDZeYc0FwTbD4FBYFEV
	HT/Se1M19+smJfJW/geuSJiOwbCc/SYnYH1kTi5fyDkn+VyfH3YQLQUG/KpxfjIwdxZ2wz1zn3Y7k
	Vt5DdbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GRS-0000000CAG6-37wn;
	Thu, 17 Sep 2026 18:02:38 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GRQ-0000000CAFc-0P6P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 18:02:37 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2dd88a115ebso10653425ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789668155; cv=none;
        d=google.com; s=arc-20260327;
        b=RpQG60I6VJ2+kJXv7dchiuPwhzGtZy2fWdqauqZCHxDVzf9y/eETGbFVSV3yFkAgPL
         BjOPmsI3GQn0RHmpUK6pWw6jnEy/1xiCb4F2MjvvK86/t7/8TLhqTxPyBAs6ksm5gtLs
         VKkcRS/n2DX2tfJCuI4viHjOiZmmkSKVpGJuV5O0V1GwJ8ZRi54HSxHjeHZTCWeBtx6W
         p6pJm+MANiqbtXrXDYzXzxesviDbcIHYkV1v/+DLxsx6RJ5is+3m7m6Ccl0IVvKZO95z
         b9214gJz05GCgNAkpGkGItEfehw9M6kBP+qXZULr7l/7cLQAHt7jPLlkyDXYLm6piL1m
         e6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pgrlp+kanKdNoXJ+vKvKqsAcIb9YRQaef/KFSYsD/eY=;
        fh=fZuHi8264Yp2cKy916S/6lgOtniovtDdC/k2HuflY0g=;
        b=iWGnQXHVRK7Avmk77zE+W1dz50BQSUHTjW7G6B9nRvuPoFbdjmoH4NP9261xEly9RD
         SBthHxGurp4c488yXuxgIMCUSINkVzacUfee9zqMGjzUqGqV95UTTzeLE+nMTmLiq3XE
         vWkKBsG14ba/1rdxwjB3pXAOieqLAJAALJ+t7z5bdFWFrqfV5pWz0VYUXu6AMxh7RzXk
         Y6M564SjauRaidWyXfTAXRfc3I5/Qwo89soKOKgGd1SEpVgfB8CIGf6lcddHO/pa7bUM
         SzklluyyeOfKdmNOLa92ekOaJUPVe4MPFO+NgvAompEx+WjeJnOGNN/gL9761C+pOUjo
         qc6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668155; x=1790272955; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pgrlp+kanKdNoXJ+vKvKqsAcIb9YRQaef/KFSYsD/eY=;
        b=II2ZQtBuj/TYryid1oNfkV0rYeYTy/NJLGSAOHK88++k3xUF0JEnIfJBCHD8WkpRNH
         cozGi0pH+3gvR+3Fojt03djQ8TeB4X86bZI2sQ9GiMmAoVutnuDFBFaRKnsIWFufKkof
         VGeNhi7uoE8CN+mcWal0WqXsowwgJFH4QcwxSiTb4x0dHAh7QOVu+6jCZ9Q0aUMMWbNl
         s9s938Ikt8MTOWTigNhFmvGio1LI3eijqiRfRZePEGn111pgmDGkrPME/1qHaYzNZz/h
         7dFyi7CLwXNP23sdtfB54nf3zqN1V9xKtfAR9tE6reOZx2umuQWG8WaNXjDHygMVrN82
         NcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668155; x=1790272955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pgrlp+kanKdNoXJ+vKvKqsAcIb9YRQaef/KFSYsD/eY=;
        b=zZgEfjy+80E7SG0bDf7/YgSQYn+0Tfc7JPE4lVurM7LXccvMoAoKUF7f8q/0KPvlhF
         rgm8HPEuzPPOTWTckhRLZaS/rhjI9sCUBiy6lbN8f+mkPts708kj/loaWOqBmKuIvMbu
         7U3END58cIinOJY7CvMMlbqS4WhSwmJq8azrvaAz1Gv6hiC0aiSKLTSZaUruflSEHTK7
         uai6b0uyBEvSth083GF12QBprTw+K5c6e0k4UEBF4HU6jXAD6CeK/wcf9iL2F418O4zU
         yWegS7Q53WdgATofNfj3ZVwE444SIixvWRT+nwgFHwoVO16iBuza/f83W/33D+EUgP9j
         VEqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqohAgeivwvF8IVj2QBqSOIHSENnR6nVx+1rR8vnkxm/pe+/C84FeSEpICbWThtewAZO7BoLahJjOMSKchYXA+@lists.infradead.org
X-Gm-Message-State: AFuF++nQXCfRbkPpaxfXA3Vmiqw9+Szy1mI+LtC5oOMGG07t6dWXH4xL
	Naq0AQi6sN4VnchWg4VxdQNIs9pOnRH4+QXcvSeZygjh3REM4HRSl0KChFI5Ac23puUsn6fGKqr
	J9kt+Ubp8fvw8BsToC54BA4+Xwezc91k=
X-Gm-Gg: AYBFou2KhwVMyWfS7WwqaCNy0E99H2MrNHWfk3STQV3Uoh0iHb/Si/crrTfE/z4v0gi
	a4fN4STQJK8Jfg7yD1ClwMzQBzddVaZni4W8MU2VHhPN7HYt4hO+GyZBohSLAHKucMxiepbokMa
	RkhNpff2wEClIIW1YadZy2TS+Z1jCjFYSYGs3bjirNFF+4r19psEcD+ayyFbeSOuxkeCZQXDmpQ
	LuUOCad70iPf+ABe4vEwpDRkOlAx7c6pT4A8tJ6ijVabDtjCM7sRdqR1/a7KB0G5fqfBuZXaFFr
	ib6e9tzXbKGb5CmpvXccrgWaUzNdbXk0y9Jfv2j9S9sfXIJdAGsdqxTByL+HZ6JM4LNCLeKpUU7
	9fs9AQ6gnpSn5/gBAIUMZxYlNFkDCAeF19BU=
X-Received: by 2002:a17:903:2007:b0:2cf:afa5:b19a with SMTP id
 d9443c01a7336-2ddb1ae16a9mr141875ad.11.1789668154804; Thu, 17 Sep 2026
 11:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAAsRjR=1iL+Nw0+0erVH2t8igpobXBfcqijz4vzMO7cW=ryHPw@mail.gmail.com>
 <20260917155929.GA1023894@bhelgaas>
In-Reply-To: <20260917155929.GA1023894@bhelgaas>
From: Semih Baskan <strst.gs@gmail.com>
Date: Thu, 17 Sep 2026 21:02:23 +0300
X-Gm-Features: AcwNN1WnIP6FLPzSZ9jqUd4tiuCtAEofHa6BPB6t-cxgjZWjftKahJr7LIWgfdk
Message-ID: <CAAsRjRmmPanAjpquZ4VnDDw9jqRkxPkLsu+KjrpwsOMj8-TE-Q@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	rafal@milecki.pl, zajec5@gmail.com, florian.fainelli@broadcom.com, 
	arnd@arndb.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rosenp@gmail.com, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_110236_135062_88C595D4 
X-CRM114-Status: GOOD (  13.10  )
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

On Thu, Sep 17, 2026 at 10:59:29AM -0500, Bjorn Helgaas wrote:
> And why do we need pcie-iproc-platform, since pcie-iproc-bcma.c will
> claim them?

I do not see anything on Northstar that needs it. I think
pcie-iproc-platform is the front end for the iProc SoCs that have no
bcma bus.

> Is there a requirement that pcie-iproc-platform must be able to claim
> the PCI host bridge if CONFIG_PCIE_IPROC_BCMA is not enabled?

None that I can find. Neither symbol depends on the other, no in-tree
defconfig sets either one, and multi_v7_defconfig gets both from their
defaults. OpenWrt builds only the BCMA one. The one use of the
platform driver on Northstar I know of is Rafa=C5=82's: 767012397976 says
it was tested with it on BCM47094, and his test in the thread on the
axi ranges ran both drivers on his board. The platform driver
enumerated the two BCM4366 devices on its own:
https://lore.kernel.org/all/93ee7456-4179-4d78-b980-1df0b7e0278a@gmail.com/
I have not looked outside the tree.

Best regards,
Semih

