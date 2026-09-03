Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52C3C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTIAyjLXIBFP+xJnGkEM5b8xcOLywbtqieoSzaYak6M=; b=i2hjx6AUCMBbHO4L6+LQMJ8pSX
	fZE6xJYFCC/rw4s5ePfhlEP3H1yl+qGNl8adOJ+pMRXOu27u8i7WwDE/0y/j85TwwDj8u4Mj5rTw7
	7v0Q90uq6j8ZN6VS+FEhNU44KFn1fzMIItpAxrQiZuhIFkTKXmlkxGOQdo2EaGPgfzrQgIbY29ygp
	lBHFyrwPJUKG9l9Jt2FAEKcHK+kjjvLp1dcH7osCz7tnY3+arRmifDFjNd8SWy/JckMY+DuCudA/o
	ix+Bc7SlWNbdpGswaO+DXWAH6SnrodDZ1o7NWBhi/db2HxYjEO+tMnCYsK8vBt5iZWGFVlxP8xm4q
	eRVJqlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ETL-00000000az3-3Tbp;
	Thu, 03 Sep 2026 20:55:47 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ETJ-00000000ayP-1kN0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 20:55:46 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-90ce08834feso5423136d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 13:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788468944; cv=none;
        d=google.com; s=arc-20260327;
        b=YsRM3t9G3XsRCeDiTaacKPGahjU+SE+GC9KZOVLPs6CBaAa4E5+f6TBHKB7oI9haIo
         i5o6RABlQYmMVOceQIZ3sGVvTHvAiMbIwKOC0deGqK0/Tf2ne9Cv8w+WCjzUOBoaocGL
         9B6jWNgBIlC0pQeHCpMzzRx3QGtT6E2UfSCFSwVQTRigy0upABCJc6mVKE54Fz7sgEvD
         2xiCJdfiREzyav2EARN9hesSAcyG3V6d0BpSwIkTEnFFOLtHzcv5Qlkq4oHCXZhmOZ/o
         xv1LpBwesrnHGVQNHcjg38DddgRltHzFzWuBQwUcLSstFmiooaLXL2qD6cPebB1mYGKB
         3LSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qTIAyjLXIBFP+xJnGkEM5b8xcOLywbtqieoSzaYak6M=;
        fh=GqJeDyC/jw/R0FRYzXSu2ZSrrlJUpf5TMCjrQZSdV2c=;
        b=VdYFYggKrIVOUIg2YyMk2iamBnni4f+OVre8YGygp27PCD2BHGp42i6aZ+wcto+ZQ9
         ddL3ID4pYDQqFfL9wHZcooQS/H9hgcze1r14VOTS11jHaRFnIU85WdbS4NunST8Q9MOq
         iTUL2988XW4Dlb5s1ZPmiSFr2oSJJlpkGxihBw6DUXxK0e4IjWz1TK4fwbrk20BbSr6I
         NVeMjKbedbtUdeV/oCQTPgWWIlhay3l4U65qjB+BWukKtCdfHaoBXVCmrReLMVbWTK1q
         cECzDcSgW3Tfdb8bVKBzxzw/mo3h+4WnuYuqOET8TPMxI3IU19xQDqEinIRKKsJlBxQk
         NSjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788468944; x=1789073744; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qTIAyjLXIBFP+xJnGkEM5b8xcOLywbtqieoSzaYak6M=;
        b=awIdw/nQ+zdhyqhWPZWiQUWo/FJDv74kSvE73NxUCBHm8uAmGf3wznQgc65XA/8NkG
         tSc+zgm6agRIxAST2InveGRt42tuBVRoL2dQ2/OUcVRCGs9pioIKTbaKhy9aVt0yH+Oe
         twppmRxvbTK5cVZ0qgAtfRZCy/U3abS1jLhVY3ObmD8SrNvI8uXifJLbqnhJNqe23h30
         GvfZ6BHWoet9y12lefwJ13Gl8d7qOkfZG1oqJ4AfXl+I4T/rXHDn6VTS9KNnY16hUIdj
         5udjJPtlalzc5CL2UPmChgRtsoPl7sccid8FE8gaDLuzxSIgKKpYnmlZrylnO3JEqttr
         3Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788468944; x=1789073744;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qTIAyjLXIBFP+xJnGkEM5b8xcOLywbtqieoSzaYak6M=;
        b=b0ABLIPqKtalK85fQmJ/WfnZYrzeB+0dGkNEAItE0OEIwHZS15C1+3N+VShxbS73rg
         2yXQC98Ab3cQvUTJahrpFN6MOGC209IeizxmniYP8IOTDcopO+DYMz6DgoPHMvkygYD/
         ppXULgawqTlr9H2qfZj1kJnqPxTHg+o9QySo3V0bGxrvTtLL/RqwecLDLVO3uwDOjGvf
         yxTIhXRr1t8LhbUAd9sp7axIG3Z8/b+IWBa7brUsEwPnZVeCVbs2pF1GVAUx7MO6Oo+p
         QHlvK5ErkvhEiS4QgcKSGFWsPrTy55MWwMtJG427qCR0Bzj/qL/Hmtvn3atLxYr79mNU
         MRsg==
X-Forwarded-Encrypted: i=1; AKwUvBz4XGUwqLRnsQFtPwRXdp7ylVQ3e/ZJzUC77tWQ1f7WPTTfHbvDe0G5flvpmhDNpXuLcXlfgMZAnEAiR56Aa/Ys@lists.infradead.org
X-Gm-Message-State: AFuF++kuMGZZHprIhY9V84kItUmQgbojTnBUifTO0p5/Vmrr8xDbtJft
	Ujcys5aCf5IkNdNuM0TKkCSUdfcg4RKN85m1sq9FB2YGBjt5t15oH+GIlpCJJcpINy3TGQsQ0w1
	NrK6IurdJybHu0ESMmvkUCjfJiR2izGY=
X-Gm-Gg: AYBFou1aYYVfFkxsHXgD0Qz+ViY7qr2i5TYgXpAGHL4/XLD+odL+CigBXupLT9XN0NP
	Yn/TZ/mMDtwPg5L8MMs2NfHJ0GI1/lMjgL9vRglw1kWVWFbkbDlO3uAUNTyEM98aIRbu5c0r5ON
	DRBLYCxsEEnf8amTK7+CKdPgkhtkam53jeSDOzIY9WmJC3thrQ5Rm74MaI8lazSLyix/q+D8NBI
	LZmep1FY/s5/JsUqQ85Jz88enoi4nc4pjvhFv4Pf2PEHNFfq/1bgQ8IZAfrrkX7phvFUUm4S9wy
	MaIaduYDqAhqNZeORpBf+2TKhbRUxGhzfDNFwiigpcttsYd/EaSjstilNyCyU+O/oMqTyD8z9J4
	kfUMMVu+satMvRSBehGem/u6PorA/cdSp5UMALZ2L5jgBC+/3y7ABVBs/XgMbUJlTW8HXjgleOJ
	jw3dSLNWEt2YWRTd9Q7A2OGXJ94G2XasRPVx/o4Es=
X-Received: by 2002:a05:6214:4705:b0:910:34bb:6987 with SMTP id
 6a1803df08f44-9103ef75ef1mr25697406d6.12.1788468944023; Thu, 03 Sep 2026
 13:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260802145109.728793-1-pbrobinson@gmail.com> <20260802145109.728793-3-pbrobinson@gmail.com>
 <apl6RddLcPz8Q2-O@apocalypse> <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
 <8f948621-fbeb-4807-a4c2-0214ce5d3bc3@gmx.net> <4c67126b-798d-40d9-9ab6-8fc876fc5630@broadcom.com>
In-Reply-To: <4c67126b-798d-40d9-9ab6-8fc876fc5630@broadcom.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 3 Sep 2026 21:55:30 +0100
X-Gm-Features: AcwNN1XzO9ovKsqnviFFSdy3uvNj50qpUfsiMt9Bc_wJqbWlqfgoRFykn56TcNk
Message-ID: <CALeDE9Mr4asKmQaQ3yRfnf5B4cvVkZuDTB+8BesPUy6djpkmVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Andrea della Porta <andrea.porta@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Phil Elwell <phil@raspberrypi.com>, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_135545_484429_7A425AC7 
X-CRM114-Status: GOOD (  12.40  )
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

On Thu, 3 Sept 2026 at 19:55, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/3/26 11:47, Stefan Wahren wrote:
> [snip]
> >>> Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?
> >> It should apply cleanly against Florian's next branch here:
> >> https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next
> > this branch based on 7.2-rc1, not sure this is intended.
>
> It is intended to be based upon the last -rc1 that was released.
> v7.3-rc1 is not cut yet, but when it is, I will rebase all of the /next
> branch on top.

But  v7.3-rc1 was cut on Sunday 30th Aug IE 4 days ago ;-)

[1] https://lwn.net/Articles/1091420/

