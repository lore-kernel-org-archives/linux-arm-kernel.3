Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDDCD29F9D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5sOFKhhbWxoz81S1+CXD6VUF6R09kQsa2DuJ0ohEo0=; b=MdIUizeijsmKqIhtNZKlDqdwvg
	IwyhA9s7CSXdGTZ4ZuXbTZ67wZElTA/tuI3DaP294vTDtm3Pxi2k7nyye4+V0ETRDJcpxKX/wA/en
	n2B7rp//2lcqeD0TYCf1b6y5TGZl0DA6hiQBaFCSKb63c5xzI82uSg6CBBpUl/aNMNQV8MmFQC7o2
	Yn4Phc5aMGEiRBWW9M952+6xUBuajruXmogdcsvnDY7gWWefG5UfZhsn/rUDjrt3dgvrSWiaqf0fE
	jmb/Fqlkd20/B9cSZ2SzoXnEANkB5IkGdCw0KU+9ltIKeJAgfvSo8l6l7FUnjOb0qgX4MCchbq2l1
	UsmCa7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8a8s-000000024I3-3qPh;
	Wed, 06 Nov 2024 07:07:50 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8a78-0000000242G-3YEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:06:04 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539e6c754bdso6330286e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 23:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730876760; x=1731481560; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5sOFKhhbWxoz81S1+CXD6VUF6R09kQsa2DuJ0ohEo0=;
        b=M+SFCwk2//A5Kn+4+L3b0YpAEsg77kV4R1d2md4AiGYmd0ODTyWYvdm7C+ptskaDWJ
         ji3KL8FhaVFOYZe0znw5/tDlEe0JGuUTr+zO0lb9ee6f4pfF309HTGppHpwPecS0s4h7
         ZdTBRtX4MNUaIuubjq9T//J/ELRcBrcWapPjGHxW0ryXNxwFjZivWtNXKPZ3+mslqlOo
         +q8TvZ9pZmgfFitBVmYLnPuDdGtt5dlshXUmwCIeejBYz+3b7v/TYxoeyeTc37s0m2jV
         Jh9TbRTK5dWVejF7HvF1v+zKL8LL4HT1WV8ii/DTBRgcbUANHzwpYYinU2DNt6pmgUmv
         e4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730876760; x=1731481560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5sOFKhhbWxoz81S1+CXD6VUF6R09kQsa2DuJ0ohEo0=;
        b=SULUGIRk7VFoe1ROPOimna8v4CI0IhGCiELvqODLmjKQ+HdpyzsjsSW6tXWML9q20Q
         L2CXiKctkbD8mebDyK8x1M2QNwjMY1RADUbBJGHJQuofwfn37lKXQgD7po6TdImbpIZx
         4ZbalrB+KFSJ/nOG/GEtUsfnIQhTA3h+2kyagtkqEih3I0a+/sk1NoLxcrZH/GBzgs+E
         wt0FgKZCN2s3Ezoc8Rd/I0GSrRtA50t7fpw7WJL7t3GC3N8VTalk0gND7xgCFSu9iaW8
         zwd2zwAIpEDmhCanoErwLWNwyxASF0xmNY8CxYj6/ZfoiFrpcCse2MlcER/eFdhinCFg
         zY8A==
X-Forwarded-Encrypted: i=1; AJvYcCW2yfQ+n8d8wbtN8vxWG9TyftoTH6IJozSbNZ9mEAhWgryRBMXg6Zertur//pVNoWrqSd6Ew1GHW/iWEfhym5xv@lists.infradead.org
X-Gm-Message-State: AOJu0YySPN/mbpI2jmfV7cCnUb7ovo+ufekuIDFCrfkgIra8OtVE4CvQ
	f5E9EGfldp957X0bimMNO75flyT8k1fOpT3qyg5weRKwc5evaz62
X-Google-Smtp-Source: AGHT+IHch6RbS1NM1k6CBI+Hi17vN7v1edOLx1yQHVelZgvWVj+Tc6VeH8uVB1lg6GXcZxXjYmSOiw==
X-Received: by 2002:a05:6512:ac3:b0:536:56d8:24b4 with SMTP id 2adb3069b0e04-53c79e15746mr10404636e87.5.1730876759339;
        Tue, 05 Nov 2024 23:05:59 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc03asm2372232e87.207.2024.11.05.23.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 23:05:58 -0800 (PST)
Date: Wed, 6 Nov 2024 10:05:56 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to
 PinePhone
Message-ID: <ZysVVCIdJ_hpe0OS@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
 <20240908214718.36316-2-andrej.skvortzov@gmail.com>
 <CAGb2v65Laka+YaPyAecwxEhMkoodrXnDPn+UTwZUS_wsSBMzyg@mail.gmail.com>
 <ZuazIgLz5PP_Z8Cn@skv.local>
 <CAGb2v66-saec9RcQsCTNOz_Tz4+BSFPdDd6CEA+RrGcF6kCY=A@mail.gmail.com>
 <Zyp3N9pGWhLqmtq1@skv.local>
 <CAGb2v66DgOmfm0U_dm-+=3nEXaZWUMZiajCdkqVJ6vUPvGC8tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v66DgOmfm0U_dm-+=3nEXaZWUMZiajCdkqVJ6vUPvGC8tQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_230602_953757_23472782 
X-CRM114-Status: GOOD (  21.93  )
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

Hi,

On 24-11-06 10:31, Chen-Yu Tsai wrote:
> On Wed, Nov 6, 2024 at 3:51 AM Andrey Skvortsov
> <andrej.skvortzov@gmail.com> wrote:

> >
> > >
> > > FYI I'm open to either approach. If the firmware can do it, that is also
> > > fine. I don't know if it makes sense to have both disabled by default
> > > though? That would break existing users, but so would the in-kernel
> > > prober approach, which requires both components be marked as
> > > "fail-needs-probe", and also requires that the kernel driver be enabled.
> > > In other words, I think the firmware approach is friendlier for existing
> > > users that have the original batches.
> >
> > Current patches leave original magnetometer enabled as before. So only
> > the new alternative magnetometer is disabled. Firmware prober will set
> > the correct status. So you are right firmware approach is a bit nicer
> > for existing users, nothing will change for them with any combination
> > of kernel and firmware. Let's go with a firmware approach with current
> > patches then, if nobody
> 
> If?
if no one has anything against that.


> I'll wait a day before applying this patch then.
Sure, thanks.

-- 
Best regards,
Andrey Skvortsov

