Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CBEF36B91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6E6Sf2wjux48UXY2LuhatqglhNB6b4e2gWC39/mIIk=; b=ZDu9EA2KExvuE3/wBswOB0uiXZ
	/YNcttWfePwRseRodmaKqTth9yojdqACekBpqao0Yak10WHhVakH3d7kHbgtKVTMbgOXuOyLy8dG2
	KTStl3W+vdmhuEa0rPl301fLLobMHuqD7th2P3KAOkfMTeD1/lKi94vpTk+S7fP+CntgNmmn2KBOs
	H3/F8lbxP5tO2ILwfBxegZJKf3X7vKWo71z8gPaGoj4EyHp1Pvofj4ZSqCo1T1WY0jeceJpc6WWkm
	sva3KhtitMk8liKvSTPi7favVzpdpOasQJh5wIEYNRrMlYP7XhIzWuGLHvgmp4KLKiQaJqZr3DHG0
	OKzZpg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5KC-0000000BgLG-010q;
	Fri, 10 Apr 2026 06:26:40 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5K8-0000000BgJJ-3ej6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 06:26:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso234612066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 23:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775802394; cv=none;
        d=google.com; s=arc-20240605;
        b=dPbMDFnEsMfgxguL+AVYv1tXNM9g1uZQCtQz/qQaWe3neW0cb2OPp5MuxwX2oR8hml
         cJe8rq+q+UdUNZ18PdLulhei9Rfuuuxiz5HsAbWGgFN8FY237wCjbTDmS4k89w6akbCp
         /EfZnsX9k/YTm3Or2ZAakIoYnZD1wMzcTRMPGdkxeVDuNKgHV+CXculgD49b4Q9LTXPN
         U23eTSjfHe9FyNi/J2zjRmdC8dPu3059WNC9O1DHwVOg5T/7hM0WDDpPpdbvqD9nsuUb
         qnLUFjJFeYlBt1j3MEDshRyVnMB8/Fj2GYfOoP7GVQnkTX/8Vfy9UKmma/JG+PwX4NSW
         pNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k6E6Sf2wjux48UXY2LuhatqglhNB6b4e2gWC39/mIIk=;
        fh=CZBhfjVg9tEXaiDoqL5RVEUQDegB1xLGm7Oyav7ho3A=;
        b=brCxAVp3cHbhOyCU32CDMBaqb6rfnr8nl/5ahvQAcejsCd4GWpp3QUdIl7GLbXv6pq
         DXTNwhg9SAHf0U9rN1cBR30PRsgV9vOyfOrjsnIvGCwPxu7HAoHrLjSxRWnDtbAyOFyN
         WyuhxaikN6QNaMmB1CdJf/fxKs6R8OyU4IU8CfMdOhOBNQJtXhCYtjqv7T1wfSHzCA9+
         8cf7f4Zxwh/QlHF/QBWQyY+BvKXIwG8mxJM/ifpO3e/8Zj8LLBhRKN2+LIi73IQHSANF
         4zz6Zbd/D/+kvx8EPJc6IkzZdjBmQbw715Qs+Kj2XRTbJKJ4fQGDj5/kzCdgx6nJuXVU
         kroQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775802394; x=1776407194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6E6Sf2wjux48UXY2LuhatqglhNB6b4e2gWC39/mIIk=;
        b=G/cxNHIq0sl83O2DmWC7oq2LxavZwiKaXuP6+3dW7JfmsPVkTV1gmrYlEnXDlX3Vrz
         j55Ei9zoeuYniPT//0mG2B+8pSGYfnWAIb5wDYo4Z3T6ct+5skHsCNpM1E8Ul/+gfA+f
         ez9WlFpmLgA+CbRZxM1gLYlwVaUsuQSOojTKGjKrnwABlBOZe0hdDmqeXETJtDQ6UIHr
         wFZElpfnzXvF3MAvVwOIWGeT5F3nnd+j6mM3jnPCHQitkRNUxBJLDvZZKC8uD7crEa1k
         MZwelw1jo+WPXkaMf1Je6IKSmyAi0LQlKPJxu4FSxfVS29MZbthBDVJpYyGT60O2D5vn
         ftDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775802394; x=1776407194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k6E6Sf2wjux48UXY2LuhatqglhNB6b4e2gWC39/mIIk=;
        b=FYrs7BGSTB0rxEbzeqUOsYMT0gU2hfXnSPhcEswr/Dl2+2KlVd2qV+AKd/s+pfnekn
         A49y8owhaDK4+5Ygg1i1VE3sog0yCmfplbvPuRLzsP3jmI45IFxsEQkUVo19BJjnnuiM
         1co2WgpHbVdbLQ1o7r4l013VqwU7r3pXkTbQC0lGix/BJ0RfSlI6MOqUYdGtD6kVk7UP
         55Ye/tARmraELIspz/cQyWSHNxALZGRwBZm2lfKkX5spgCEAK61KWkRZFpyIxJizS0bL
         UMJeDtTBVSMF1ZqZ1TGMSLxQIhvBmF5BeiIBWT4KB7ZFHHsB0mfFxFUJ40aM/FlOqg5v
         U5yw==
X-Forwarded-Encrypted: i=1; AJvYcCXJplUUUCOZwqHSIJG3SFvdNQn98fuF5TUZaIc6Ss5pSCFzhKmUcsSvJwAc457pK4m12kUeqGVZg6fO8ogaWD9i@lists.infradead.org
X-Gm-Message-State: AOJu0YxNmExVgyTd5b7Vq8A9zu26NyvJ07iBXtOqygg7og5KQ5dA9clr
	w+b0zXz2rEQwBgYdSJTHYUTD9/alo3zsjs8WX6JLFd7//5L55BNvJEdGrp+w5orxlO9RMSQMmVo
	T8MkXTB3Zw/YW4FaktMVshkToK/KBjFVvxlp1
X-Gm-Gg: AeBDieuxUaofT7Y7WB7LTzcqrG22Z8JKe9OIyMhL80MRUTowcQdZkDJnsZduukQFHQK
	EDHd/R/KvDDDv8JTDHnTzz/6MiuFeBZy6pbS5wSD4eh2xiIiHR0H/fW4obNZnb0T+VWiIZN+Z34
	Q/b4iS8ZB/s/7lLRRaKyxwntLp2G3vPc55XfDwVuN8EqoQ8OWNMj0E6Bt8ChraAMIyp/xBJ+pfF
	ZIalV6n8UJEQSUWaBBqHKPN5+2fzDY+U/TouFJ/Wr7eblBLf8PpjuPO33U7C3sKSMBtdey+Wrcy
	13Novg==
X-Received: by 2002:a17:907:8b98:b0:b87:d09c:1825 with SMTP id
 a640c23a62f3a-b9d72792c0cmr109602066b.13.1775802394103; Thu, 09 Apr 2026
 23:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260409044939.7647-1-linux.amoon@gmail.com> <0ee54525-928e-a1ce-ec2d-1f85cf15abbc@rock-chips.com>
In-Reply-To: <0ee54525-928e-a1ce-ec2d-1f85cf15abbc@rock-chips.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 10 Apr 2026 11:56:17 +0530
X-Gm-Features: AQROBzCIL4-FKUNlkvast46wQIb2LKuGLtf3o67YP5zyFepCASgnCq98IhRcFwg
Message-ID: <CANAwSgSE5NxxKC7WVvisxB1GsNOoY3X8Ar3t2BCQzG0MrouXdA@mail.gmail.com>
Subject: Re: [PATCH v1] phy: rockchip-snps-pcie3:phy: Configure clkreq_n and
 PowerDown for all lanes
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_232636_915773_414652E5 
X-CRM114-Status: GOOD (  17.10  )
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

Hi Shawn,

Thanks for your review comments

On Fri, 10 Apr 2026 at 06:16, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> Hi Anand
>
> =E5=9C=A8 2026/04/09 =E6=98=9F=E6=9C=9F=E5=9B=9B 12:49, Anand Moon =E5=86=
=99=E9=81=93:
> > During the rk3588_p3phy_init sequence, the driver now explicitly
> > configures each lane's CON0 register to ensure
> > - PIPE 4.3 Compliance: clkreq_n (bit 6) is forced low (asserted) to mee=
t
> >    sideband signal requirements.
>
> clkreq_n is now force asserted via controller driver if supports_clkreq
> is not set.
>
> > - Active Power State: PowerDown[3:0] (bits 11:8) is set to P0
> >    (Normal Operational State) to ensure the PHY is fully powered and re=
ady
> >    for link training.
> >
>
> P0 is the nature state when linking up. I don't know why it should be P0
> before we even don't know whether the device is present.
>
Ok understood. This step resets the lanes to their default state for
initialization.
I=E2=80=99ll collect additional input and verify if any configurations are
still missing.

Thanks
-Anand

