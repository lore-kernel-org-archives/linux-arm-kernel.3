Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2E71099B52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 23:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JCzvUReAvmRaGAkyAEznszoR+jf+OXTsBS6N8BL9C0=; b=Nh+ULpZbcniIM2yxRIXzRF7SyC
	L9AMg5gGTfzMmJUB1l8tlXldA9husin2lBGg6811kzxDGipkO9oMoTUKj0YidFu/3WN5/XCNYQ1Zu
	H147Pst+en+SAj/TdcTzArZYkdrgoQW6+ElCWjDIs4pLDdMActy7S1oKyUvaX1kkGO8LXv2dhAAO0
	iSSbZYkM8xZWUUJ7P3tpuAA0L/LrdyMaZLjpZ2HAqxmThskpU8pCXCnD1tzJjuzVTtMdlpSx6dxbn
	oFNha9PBJ4G44mvnYuvffUkf27JiHJc59yxMa89rmNYJCc08YOe2ElIBKUeetV8bY9ekEs5tGy1Fz
	0X9KMGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iwd-0000000DmJD-2U97;
	Fri, 20 Mar 2026 23:07:55 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iwa-0000000DmIb-3nbM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 23:07:53 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6674cba2c50so4922209a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 16:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774048071; cv=none;
        d=google.com; s=arc-20240605;
        b=j25ClRil227VYVG6MjY6EBP/cseM765azsw3C/yLP4hpmUitXFSJg+I2QjpukdxERs
         /w/NWyrteunKQSle8qNxrxlo4xvkcisS3ZrdCYBaWGwtgCxPHUMc2Enl4OPHLOFYUVsq
         Wng3isEkNLYY7Il3PJKfi3VFVVVrFRPwmkBSlOB/NRs6D9dMbOVvUI6pdtA5mzWPkqWa
         x6gikF25VV/2/01PdNyja5MgkFhw6mD7yK/i4n45x7Mr/5wj/babv243CwEv0qq7InZV
         Pz34Ek+z7+HIzwxrlOXXAEMi3Xdtw5L8/2SvL2GN8/N2HTRalUcdKTT/x985wyg8w46s
         AgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6JCzvUReAvmRaGAkyAEznszoR+jf+OXTsBS6N8BL9C0=;
        fh=itPnKQWmDdh99Q9Em/PPUKyivsSzYHppc8m0uI7E4AA=;
        b=FMW4WWcv5Op9OaPDHNjvBmll0U9mn6icZTK/bum3IE2rskDFIN5tWSUKELtifbMmV8
         X085YpPfoZPWSNS0hxiYXFDd4VjO9So0UsmT6nBwej+OMv6ovtrjiDWv5/avXLUTWIWD
         5ZAH9FOVdbFy+01v4VA3+74XZC5xhsxH11LS3YK7UZKJwLqly54RU4jj2QkfeULbjfGn
         IRh6PEkWdgwL/wNhXS+g9GkSbhIeVYAseW9lXCNdlAMMhxMmAxOvFkazVGhoutLGiM5l
         Pu0dlJlYjE9/+iCFya71d3GtMOkrzCRPw91I3rdcpWmQlzOhLP7x2G9kRw3GbonSRN+a
         iHDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774048071; x=1774652871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JCzvUReAvmRaGAkyAEznszoR+jf+OXTsBS6N8BL9C0=;
        b=mHQbPYQDHfb2a4Wrgh9D/WaD+/npYjYUfa9o+eimfWW45FuLa2JaSGTB01k9fQfgCg
         ZLkDhafbWWjQPE1uKjyiiYACSYUXXNeAd44nocV8aCjYT2jwQ3xb1O3HAvLWP/SBwXXB
         hQFx9qpH8hpb3FY5lRHjpCibfIUC7vthOSVq44FvR/G/6ujgpinKd68SF9ot38S25+jc
         ELJ/uAwLkHUCEcu1k6e/+8XRno1s6hAWTzkuIDqLrJS4JT+YNUfVrKJO1NUrg4LYE82T
         tjEjez2KMr2oKAMkPJgiOKxTolzeDdXXWzAp4Oj1/putf9P2C2XSy8y5oKAJgWjmGE2V
         2nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048071; x=1774652871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6JCzvUReAvmRaGAkyAEznszoR+jf+OXTsBS6N8BL9C0=;
        b=k/bZxHFYQ9MmwFtmqf3QTqurywjnGIplMVBFx9Cq7LYCQl3wYpKPoGhO0+nqhy5/++
         swKXYBmqymXIugoobe+nq2LEdKHBe7zBvZej5ZsyJ3USDLG581Ia/S0D70co5Um+bS3Z
         2R3U7PIBIVao1zKT9WBP8zamvWrZ5rwF4f1/8TKc62tE3hBuXwZFsKdKmHJDU8wj3t0e
         3gfbMSa7v9ItHgw+SUrsu8tpHGk7C17Wj1RV2HU+2znoS9pKBIsdtazhGKL5tk22cccF
         SXQFro0KMMUzcX18k+rPXB2EQsEbY0kEARJZwWvCcnGgULgvn2tcIDSe6U1OdoYGogE1
         zXjg==
X-Forwarded-Encrypted: i=1; AJvYcCVmmPMAdr195yxBKcTcyCOL8c0Pi0PzF+5VULzoyypXYy6wvtOQiYZxxKMIHCbnE3YS2Z0feG2fHC9FiM88qGqw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsef5JiWhfb70tFGOKKAgszHbnxymSpqK/qv8aNOf1MQnTO1Qn
	55cxALfMA32d4eD4Ml3f6w8FCTppZMqHPTPXsdyrviQ/4fwnYauUWRBDsIkekHjPzUgqSHN3LfW
	bBAvIM1Lxb4PITQRxQQTuCN8YsgsPXHk=
X-Gm-Gg: ATEYQzwJ9x9y2vuTug1lCA9IKDAh9dXzmEC9P07lIAV2w/gi8zBeQQh39n/YrctEUps
	MtpnL1FaN5V/s/W+D7YwMfpc/A7z/VuSjzvfqjVGwuEa6wiqBK9vOw/9FtqZX6ApC2T6TPyNNAV
	30z47Ine0a4WT6MbXB8+6X466VvopvV04WeEJHu87I9ow6BhI6kfOF5rRB23Cl7ANvvC41LTpC7
	HkY9ykMcuQ36Kgm4t2sjsLq8TmBwijo9aneUGXD1fH7P8yY32hmwOyBrqYBEzz13IlMjItxjLFJ
	KGOYlmC1o9HgwEOJIXYoGD1rMhlZ00AQpmU6V6gnKafOgmg+s/rp84HNhCh89rjHE2N1FWSihBm
	PJOX9Og==
X-Received: by 2002:a17:907:7a8b:b0:b84:3fab:4251 with SMTP id
 a640c23a62f3a-b982f58ee8cmr336055466b.15.1774048070294; Fri, 20 Mar 2026
 16:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260302000736.592422-1-rosenp@gmail.com> <fff10c34-6253-4608-b969-98a7220fc9c9@broadcom.com>
In-Reply-To: <fff10c34-6253-4608-b969-98a7220fc9c9@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Mar 2026 16:07:39 -0700
X-Gm-Features: AaiRm518z60-KQ1iXqs8-LNx6Z0ndGXEzRtFemv_pentK5ZgaVAgM8oOuBqXssw
Message-ID: <CAKxU2N9db_RA80ikviMHvY+xgG_myPmU3UTYaoD4uvibBeshEw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: add root pcie bridges
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_160752_967731_A7683A21 
X-CRM114-Status: GOOD (  12.71  )
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

On Fri, Mar 20, 2026 at 2:39=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 3/1/26 16:07, Rosen Penev wrote:
> > They are always required and instead of duplicating a definition in eac=
h
> > dts file, place it in dtsi with labels and work based on that.
> >
> > Also changed each bridge@ to pcie@ to get extra dtc static analysis.
> >
> > Fixed bridge numbers as a result.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> While you are it, can you fix this warning:
>
> arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning
> (pci_device_bus_num):
> /axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@1,0:bus-range: PCI bus
> number 0 out of range, expected (1 - 255)
> arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning
> (pci_device_bus_num):
> /axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@2,0:bus-range: PCI bus
> number 0 out of range, expected (1 - 255)
I'll look into this.
>
> Thanks!
> --
> Florian

