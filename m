Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66386F3D337
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmtEzP0I0EuHpFfZp70CExB77nf4cTFGwGb65ql/OUY=; b=uE2V3tV9qHYVRHDPvM1GuAhDUB
	6UjSgwCmgjqhKDO0Fla1GNEeTSJiIW9NpshPl/gFKXTRQtAN8/IZahTT0IhS7lrZZk0tkqzervZdM
	Hpg1O53SSlJfqF4zg6UPNy3isryO0jj/xaWS1z8uwpbCxerkSgyZVwhCNREORfb8zqgMBU83Kkge5
	YMK2YzrsdfHJhvdZ2Qhes/wod/vuxpiE+NaleyScKLWrFM+vgqGhh9qmjabsdqU/0jp7WyH64L5G7
	PiT35IxQcYKUG/zHhkgT/98TJvDZWthm8gr+0vm49KHdDt/cfsW4i6NycwJ8Cp69XSfEIUT4Isbtl
	4+NiRTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCBL-00000002Fy4-3Ttt;
	Thu, 05 Mar 2026 17:08:15 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCBJ-00000002FxP-2qER
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:08:14 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-506a67282a0so78960761cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:08:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772730492; cv=none;
        d=google.com; s=arc-20240605;
        b=lip86NvOumeufQPho4BDBL2d90d/2MLlJmYAxdX2OJ9l7CDbBSO/27FB2t5aZRp2JV
         zWlftMeScjQymW7lZ97UN29a4vXDOpVqMDBIMnQEpSR3sMyjC4+emg9oHvOkoxtimjId
         z0A/XevGLFTi5qKHIpXgl6O/JNo2+4Va4iEeNgF+yYTio7qYKdRUtFyUOXv22tico2rk
         53kEXoDM0lsju64kSI3oXYd880a38ehVP3c/1iMwUO5W67/9FAuT6DM0bT7FW9NSQuhV
         XeSyw0AUkA5PA3o2RKfwSOMcD1AQnBcoO44x1YBpvrcMCqOaSo5ho3/JVuRbmQJiM8mn
         4XRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bmtEzP0I0EuHpFfZp70CExB77nf4cTFGwGb65ql/OUY=;
        fh=ADfgY4VHcr/I0qXQRIDxSG11/zMo11m1SOPIxO49GqQ=;
        b=LLkqV8BTHsb43MvMAOHYm1sqaSrj+QxR/PsWowlnBDFaWGdWIx+USZRsiaqzgcjaNx
         ZvkQnLQYciKdtK3uYgW/tEYphsta23NRpQMq8a7zr2+BwFSHBEgTCgJR9M9C0xCqQrCI
         GFiozB+IxT1pZ0bD5ix+CisRI84ZkTAQ8L/QbCW3YqgSjHSBEJzjdZKqtvoyngpJmYC9
         F9h+WW0nTQeme2kNDRL5t4cWOzmRgFv6PAjzpSnbIQHiZPqZ6sDPmfX+FhA7SU/aCqRd
         Vj9OppiJUdaegz6REEtUYRH6DXHbWDnsyTYsOY3IsQhUHIdZdfSQ1TP4RpGajCGMSDjZ
         LF2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772730492; x=1773335292; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmtEzP0I0EuHpFfZp70CExB77nf4cTFGwGb65ql/OUY=;
        b=guFy3XHA6vzUPKACrk6DS1BK0BUWip35nOrweT+3gDd7GC+j0BX6T3U9qoQ7AdEuqw
         rLLs9Eiae6YBExsAccZTpGxROiuW3auhBS8Ct1/5BfXPHBm353504u48ljYWZ4qsxZqf
         IdCPoBdTTkuVybi0NAa5//BVJVPImOxl9gjTcHshRijOoJWHKhv81lwNKfqq7BC92FEd
         b07q4rVDE8B5cggyr1FoxwqYkY2QwDLAekAbUmuHHjubjKTRYpot4XUqjFrZSCrvXwYN
         qcC/GjR09gCbYvxKiSpxnrKcQ4J8X/nXuL1hLnRZk7AqJBE9OdLq6dzaOKq6FPbS4X7/
         6M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730492; x=1773335292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmtEzP0I0EuHpFfZp70CExB77nf4cTFGwGb65ql/OUY=;
        b=KhANNiy62R8N4gDhMZWSLOkHzd7y3ssxC98mTRUR/5FSVH3slFZy/U9r8MtKr4Zqty
         DOL/jZLAU7wKpIGLLdAY0b7lDdZGcGRMRgwvwvJ7Z+0npwe1HcNC5Dq9vGEPm5OlBst9
         CBGFCIJ6P85EGkyLtVknw25C/dHFiP5LwLyMNMXfxPeHSh42yeno96AxZA2DbVbkxdPb
         y8vwpLi+QzDnQ3SFyn7tijRwHT3TSSfs1MAISbw7UQ3PzC0KQfX6pqs9ukItTtjaeWOL
         1C7USPTHRwVnYmpQi2YVoOiQJwKFZOzQV42EyxPzq7nmbMRvqFUnRckxlHolb9g5tqXG
         ifoA==
X-Forwarded-Encrypted: i=1; AJvYcCVTSwqe4vNT/9tY0opd0nnk33fRgjAed4942brCuwyLhjq8L5jL8BmjSkbcrZV7m8hjICSrjTCUmab2R/4p7feE@lists.infradead.org
X-Gm-Message-State: AOJu0YxdW7c8FbDrliHu8q1fyVTnTxJijdHxNsZI2yT6z3pqSWorPEvo
	pYlQh4Ib5y+0WwgXrox8bQpTi51Q1lidgmCrMOpbL/26JHrqjRqCulprhZA788bQDPpYecmoqVO
	+OOWAXf+SloXKWx6Ua7JxIH7sFyTs1eEMTDulUr8=
X-Gm-Gg: ATEYQzxnPLeOS0efPKcG+gRc2zTsNf5vh8SOj/1x3qWtxsoAynn8PE/M1ekeLkEiAWk
	pRX4f1f205q/kYdWE4H9GCtNKsStD2rKgRU3oJPvkVAKJx1jTDrt7Oy9ZkllQB7gG8O0eaY9JGu
	xvTbtKM8KYOKaWMmcj2Tw+TGWy54+rxsNJxg+Yze2gooUZDZV43lwGoCeAjmS6weMvnxQQ51QTK
	Y+c//60MSXTK4jwDlrcXo1HH4ybFjUP9CiRWVEu+/MUYr4C+LwF/XSMwPG5f5J17Vzq58S9liBO
	kAzx8qBn
X-Received: by 2002:a05:622a:514:b0:4ee:1875:42fa with SMTP id
 d75a77b69052e-508f1cf7822mr5172761cf.1.1772730492300; Thu, 05 Mar 2026
 09:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-2-akkun11.open@gmail.com> <20260305-fair-jasper-barracuda-5ae1e6@quoll>
 <9edef237-aab3-4f7f-a86d-ec8796ba87fe@kernel.org>
In-Reply-To: <9edef237-aab3-4f7f-a86d-ec8796ba87fe@kernel.org>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 6 Mar 2026 02:08:00 +0900
X-Gm-Features: AaiRm50-oYM1aGbuVflEDYupYhPjbKtTxzvjoSVqdcYL0WBhL6OK5h-FDkNMe18
Message-ID: <CAKr_iV4W+sSwOLD-CeyC-KZ4=rmWufh4jLiP7LRJHA+ifFL-Vg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 8/10
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_090813_721593_46BF3785 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

On Thu, Mar 5, 2026 at 5:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
> >        - items:
> >            - enum:
> >                - fairphone,fp1
> > +              - lenovo,b6000-f
> > +              - lenovo,b6000-h
> > +              - lenovo,b8000-f
> > +              - lenovo,b8000-h
>
> I don't see users of few of these. Also, explain in commit msg
> differences between 'f' and 'h'.

On Thu, Mar 5, 2026 at 5:35=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
> I don't see the "blade" used either.

Hi Kozlowski, thank you for your review.

I will remove the unused compatible strings (b6000-f, b6000-h, b8000-h
and blade) in v2. I will also add an explanation to the commit message
that '-f' stands for Wi-Fi-only models and '-h' stands for 3G models.

Note, "blade" can be found in "ro.product.board" (build.prop).
B8000-F: blade10_row_wifi
B6000-H: blade8_row_3gdata

Best regards,
Akari

