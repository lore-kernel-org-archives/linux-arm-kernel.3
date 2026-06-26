Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E2C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4gymTGV6BiMiOHHpj5GTolc7Qp1ch0N0uJWIjJOI5s=; b=ex2tWybvfarQl9e53w94jBpusb
	924KZh5Ta7ZyVv0a9lBxFSJa+p7q0WHYZdB6zp8U1hQoytBeNlY6OaBov/wETqMZbB7Z5R2+mHKgq
	E7zN+fnP72Q7QgWfz0Ob6Rr83w8CzvUd6ftBB1wsTuCVrtyJ5t/bD63W2QZ0yGF33uehbRufvhs7m
	G6HF4IJMwAmfQppgHUMacQseeK1eEwosgGkpnahfvmH6lwetXSmACSqYIAV+9tSirQ2OQrZpJjQ6s
	sEvhq7B4YCFRCSLSukeOddAUzijMQ/NIxuRf/yr/X0Hr3y5RkOqm2JDSzPDwbAk6PbBXkWTTYGmp7
	734IL+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9pO-0000000Bf9b-37yW;
	Fri, 26 Jun 2026 16:54:54 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9pL-0000000Bf8q-30Ow
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 16:54:52 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-662bf1dab83so1891707d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 09:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782492890; cv=none;
        d=google.com; s=arc-20260327;
        b=HEDf1ISb1NalwmZRxlKtMtzOE4DMDfb5/RtyYCUKuAW3XF6CLDHFUC3uiPCiZBHZMr
         HbW1X+RHzRDbcL8tjpczpvLGXANQLbe+sjV3THsjP9SHETvj58z1tgCbCVsPlqzeE7WL
         9Sb/HJh1DNZskykpHg2NDcRY7jgcFmb869dZUvYdQ9gSR6rfaTzdP6DH7SnhNvKxP8/x
         ruvu0U5V4vsrlVrBRk1Dz7/aWrSD+eaF0ikrGc1fqkfTSJDs7bq0XbqssQfQJTto0Yvm
         JkrdvxlnoRlfWJAPSnH/98piPvi4I0Io6amJ6Y1MWP7TF8tKaZkP6vN8D79UM/3Po+/q
         UsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4gymTGV6BiMiOHHpj5GTolc7Qp1ch0N0uJWIjJOI5s=;
        fh=7P01lktoDklHi1gbCWfzEgtxs3oCT5JbxREltjS84ZA=;
        b=Z/CHLkU3GbJwSGaBLM+gjYa3e5T1OEpy0nBxCyxsm/zgPnxr/NhM42w18FctRxLybY
         vTIAjUxXE8EFAg9xkV/plXBiwPx2PE3CNvwhrNj5g6i8AVqlVizMWdO6YgBrmNfEvsTk
         3qWdrQhgHVUk1lHbWa4uE2Q++rYzWPxAAfllBV36lVfTUFNxoFWjhxu4X2+t5pfcDXYX
         Bth4s1FiFD7TE26GEL7REXhJZDrziMcTMPrRWZbTRsAol8CmT4E78gHIKAfW39vpyeWg
         fcLmSr7GuPyP+26rfEjwoxKWr6qXsvFNkLrVyL5A1klyMEqaWt0YQJ7CoPqRbEE1zPd1
         CoVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782492890; x=1783097690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4gymTGV6BiMiOHHpj5GTolc7Qp1ch0N0uJWIjJOI5s=;
        b=aH+VWR27NnRcqdfPDDRCkjeNlVLR5OfAlZvDzcL1gd7iemm4ZHMY86lRx4Y4EeVi6P
         sOeVvTbzSGk55XkiruJ/bKqjA78QqmSmly8O3jTBJEx0cMonHzep0BHKpI8xXiy4E1sA
         LQm0ly9OnyJYeD64IqbS2peXk6diwx2GbQq/TFZO+0rHAYaRwOTXWC++pqtU5ORAzoHb
         Me1mC3MJnvlbTzBVA5kWB/OS6KOGM0l0C66e62aBX+n5cBE1D6ZXNS0Q+vDfNOIwQjvF
         Fnc3F/P9Nv/GeHLy3XPllXBlXWqEpT8OVSSBnGBMAdr7vNMlCzxB/p+w8ngIoUwAF2R5
         yrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492890; x=1783097690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z4gymTGV6BiMiOHHpj5GTolc7Qp1ch0N0uJWIjJOI5s=;
        b=rGcZ2yUYFBwsgcD00yE6ONEqKqKs13UjE5lwFZGL/o1Z5z0XxbyF6C1kKUHeGF8DsJ
         sK7ikq+rV0FN7eBcnp58TMSuozu8pq/MEm6EHxLVlwcwjLKph5hNVN9pwf+4gpLGS7K2
         1S0NVnHIvuSdBc8xKzc4ejEZlsUYK9kkAbYHiqN7iEvhDPN5c/+3JTidB+SK56zInU+c
         nngfZ8v+Zy/QbNkiP2k/oXUhsAmoBhxIRjTqXGZ+cOzsTLghtS2BF58WqMLH2TVbYFtc
         SueXmJ9iJx+ndKE0KfcM/5m1Nkr03Do4Sen/N3F5cHXJTUChXk5tdTR4BLVhKh3b0cPG
         Wb8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrWes8k9/I0oeoLpiW5lwgXmF8h9xVObo8c91vKvtq3k/TI8ggPoNGoqkioRPkEDQyXmNZfy0gNzuz5cwJ1Ra/w@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9+U5GKc8bYJ0yHXNAuq2WeyDsl0QW+lJc76H1Yny6Kr4YHwta
	k9hxbn8UJHAkE7bAOppCyG9ZRsppmsBp9wxrgqZPP92+jNYq765XVZmeLOZ9oqaJ+CgKV8nTVnU
	RCB/77Ngr3mhG8KMXUkokiDD6XpJyMjg=
X-Gm-Gg: AfdE7cncKv8X58Ud8tBOJtzqDZvSsHq8G+mwzPT38FM1XJR7QFIrMkETa5QGjH1Gx/N
	KbR26T8xIG2AHsmwduvOAoboIJe2h1/9xeXkTQoLkkT0NBHJIlxIxpEhwpz8qoIPvntKY2WM1j7
	s2LQDDHIomfAosgyLcUOUOKoTAKLDInKRrW3GUjIDL0lNSs96k6nLxKUJkkUaYiVtW1qL7dYDxF
	uykyoJO5SBWZS+QEGMbN/IniPsZ9WSC2xmWCkVnKEiOLjbZcPHkuttxw5IDTImhMoylmEtkYfhc
	ZXK2WFutxej3B0AlfhR8SS5X7jke6dIbL1lP1Nwxs7sYCrIiYEvWH9Vw
X-Received: by 2002:a05:690e:408f:b0:65c:477a:2ad7 with SMTP id
 956f58d0204a3-66487e02906mr6126812d50.25.1782492890243; Fri, 26 Jun 2026
 09:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-btmtk-remote-wakeup-v1-1-5c1006442f36@rong.moe>
 <178050901239.1520440.2026593395539384648.git-patchwork-notify@kernel.org>
 <3f9c376a5dbfc9d737e2a7f83c5db8e591fb8793.camel@mediatek.com> <17FE08E9-2229-4C97-846F-6FA099E22C90@rong.moe>
In-Reply-To: <17FE08E9-2229-4C97-846F-6FA099E22C90@rong.moe>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 26 Jun 2026 12:54:37 -0400
X-Gm-Features: AVVi8CdVv3HHwGMLXRaGH6j7p0AAQgeoBhar-UCT0NoarWVa66KqAbaQhtDgliw
Message-ID: <CABBYNZ+rR71SKUEuZBTf+E3SwRNzV2-s-zt8EwNJM3PSx9qB_A@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: Disable remote wakeup for MT7922/MT7925
To: Rong Zhang <i@rong.moe>
Cc: =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>, 
	"patchwork-bot+bluetooth@kernel.org" <patchwork-bot+bluetooth@kernel.org>, 
	"marcel@holtmann.org" <marcel@holtmann.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_095451_796391_16F3554A 
X-CRM114-Status: GOOD (  23.75  )
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


On Fri, Jun 26, 2026 at 7:19=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Hi Chris,
>
> =E4=BA=8E 2026=E5=B9=B46=E6=9C=8826=E6=97=A5 GMT+08:00 10:40:54=EF=BC=8C"=
Chris Lu (=E9=99=B8=E7=A8=9A=E6=B3=93)" <Chris.Lu@mediatek.com> =E5=86=99=
=E9=81=93=EF=BC=9A
> >Hi Luiz,
> >
> >Could we revert this change?
>
> Please don't. The fundamental goal of the patch is to make MT7922/MT7925 =
*usable* on affected platforms.
>
> Moreover, almost all recent AMD platforms ship with MT7922/MT7925, revert=
ing this patch affects quite a lot of users. Almost every AMD platform I've=
 met suffers from the issue, and there are plenty of bug reports.
>
> Intel platforms never ship with MTK WLAN NICs, so I can't tell if the iss=
ue is reproducible on them.

We cannot really remove it anymore, since it has already been pulled.
Therefore, I strongly prefer that the issue is fixed somehow or if
there is no other way then a proper revert patch must be sent, since I
don't have any hardware with this controller I cannot really test this
myself.

> >
> >Sorry, MediaTek wasn't aware someone submitted this change and it had
> >already been merged.
> >
> >MTK believes this issue is strongly related to the platform's USB hub
> >behavior,
>
> Still, I believe that there are some interoperability issues in MT7922/MT=
7925's hardware or firmware, as reinitializing the XHCI root hub (by logica=
lly removing it from the PCI bus and probing it again) doesn't make it reco=
ver at all.
>
> > The product lines MTK directly support haven't reported such
> >issue.
>
> ...or did you mean none of the existing AMD platforms are supported by MT=
K?
>
> >
> >Disable wake capability would severely impact wake on Bluetooth on
> >MTK's official product lines.
>
> Could you kindly explain "MTK's official product lines"?
>
> > Furthermore, this patch looks like a
> >workaround. There should be a better way to handle this issue. We hope
> >this change can be reverted.
>
> The issue is severe on affected platforms by making the Bluetooth interfa=
ce completely gone. IMHO, we must figure out the "better way" before revert=
ing it, or else it's more like burying your head into sand by shouting "wor=
ks fine on our platforms" (TM).
>
> That being said, I think we can narrow the range of the quirk down to AMD=
 platforms only. Does it make sense to you? If so, I will submit a patch fo=
r this.

Ok, then you guys please coordinate. I don't want to start requiring
Sign-Off-By (SOB) from driver authors because this instance shows that
response time can be very long. Therefore, the best way forward in my
opinion, is to have the issue fixed in a way that works for both of
you.

