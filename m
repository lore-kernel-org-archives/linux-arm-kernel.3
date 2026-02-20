Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD864C55190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 11:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZYsIbWRd3672L7CH/XwqnwaaGplIX+GYHJVYMKyVj4=; b=OiSX3lIOmmMN01CMe+PO+vfes6
	/Wxx0y0tDEy6R+wMblT0JgrTRAbQdwsbxPBVwGnVg2mNTNEBkBsIymw/7RoW+vJdPH6nABYYg6KO1
	LgykGO476x0hGTDGaJuPYkBBxILltk74DAu1OS3tZzsKmEaIGuMHKE/rrEIiaJJnwR6Wgy/hpo88/
	fxjPA+eATmLPeXythtZbmYnr+CG2iEdBhY88GDTGvA6+BQ4zl6mRpBvCQpe8GTbS56Q0ESwDeZm7A
	10T0dmJ/5pmogY6DPrevPLRcJ7NYED0VDu21jOIozqDxIDkND/wBGAkdGR6he57Fp63rmgMocHIz0
	nvUxpgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtOWg-0000000EQK8-3uI1;
	Fri, 20 Feb 2026 11:18:26 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtOWe-0000000EQHS-2b5W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 11:18:25 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59dd54b1073so1954701e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 03:18:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771586302; cv=none;
        d=google.com; s=arc-20240605;
        b=Eu2Ed2fFhlwIEb5LL8luBWSDK3ULfB6dtYeX2o47ONl0qp2csgATqdgrU9vG6W+D3A
         D7rUxC/bt4VPCkeltSULHp5df/MoTeOhQldU2RgRVqW7NDsSw9wXS62hDb98NaP+Nsdg
         oPd3Avg+1LM5CFTJw0N03KwO6nhPLO2or99Dq4l+PXTgHd1ywCCtLbFL9zu/e5+c1Mjg
         C4TkrOsI4EI/3wA/H59fX3LK0U7LRRdrHyK2ESHzOOcfuMV2Tr8Evc0iFMV1kZhFnzzA
         ggTCvUsquiJFCMBjXhkY0kni3fXKf4Qp9gm2BVaLKK5fHgegkjq/zJBjRZMu/PYll1q7
         tP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4ZYsIbWRd3672L7CH/XwqnwaaGplIX+GYHJVYMKyVj4=;
        fh=dBpxqI6dK/eg9od4kwMgbk5smhp9zR+uPU1BSyVNC8w=;
        b=D/rd5NDuagujemDgxjSqQDH7H27wzbvXC7TBhFkZdkK00vAaIgZZX59McXf/aitJhN
         BuunLlQg+ICckMKO2QrYP0FjMBavLf6agg5GqyPJYmQs8fkF1077Da52P4242IL7QQr4
         6u2snGRq9o/9WAX5ol+3SM8HavoxC/i2It+yRzY50etk5igaSYAa0Jy7DJkYXnFWOk1A
         Zx/Lb1fs6IMJ7zwlAxPgCTeBycR1KWTeHgf1Cp4WrYX+bPWDrnvBPQ7pMj5Cisi3Pcm6
         80cE9mpM87OKi/Uzcotx4AO5pUWzMr84JF5FwLb/SF94GKLFxIPlLh9g9OppCjIXaqn+
         VZAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771586302; x=1772191102; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZYsIbWRd3672L7CH/XwqnwaaGplIX+GYHJVYMKyVj4=;
        b=YS6SZjZ0O+KJcuK0u8sc15Ch1uU9lsQovCGAq/0kVDacFtwuY77HcfEWxwm8kSEFwI
         6jcEVWISe5Otyl6qUolKTV6SqoAsdY3AeA582iQySH93B6nKaWZXsKidLjlW7ixJZd4E
         lWdprBcwE0vfN1PpkxqLJmYh+/QSkunP6toxVYpemuYbQ29Ia/jrg4BuZL0CN42ncFMT
         62RWJJG66u7mwlYUfqm5TeVd25HaealHzPnSy8AXGkhTuJ2DdwUPBmvQKZUCPotucxbV
         Tk93dwIlszmyG54KIHiVqjm9wgAI54pV1jn++ScoXj/CFJ71b/1i//5XdpZu/Vhc7Ih1
         vtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771586302; x=1772191102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ZYsIbWRd3672L7CH/XwqnwaaGplIX+GYHJVYMKyVj4=;
        b=NoIhduAWroY1Y4ct2lroIwfq96fzWg0glerNML5NQPtxYlMjivzVbT+TTmHrNMV9f7
         SUX2dooi5WrMK/EdZKhYDPZ4yRRsoq33pFc1KLO2hg8wnSGdEloc0xBG76BUgW8MVtFD
         b6uFaaChYIaRkhiVVtm/Es4YdMpXB9VpNIMgV9yWcOd6IFAyrpKGqwqdxc1ceThz/gk/
         qM9sDu5I3IG4NIL7cJbgafqhejhL2vyViYFY0JdhaFQf5Z+7PZD23AM/Iu9XMsEKPZEj
         D0giBxX7i0HugPZFb8mMQb+fcKEIIMuiVCQQW3l6QoZ/By2pzMRQUVNaqNQDLw5+t+PH
         y0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRE/L8QM79p4nbIZQ9wFlv5DJDoPnKDeMbELONmJgH8j/6+Q3TRp5HKciYhGwbQEjA2nUklylNNVZlcqnAfd6S@lists.infradead.org
X-Gm-Message-State: AOJu0YzVKPu7jH4CuxezPxCHWb779CDmGIFkk7emS8nghYE8vQS7ZBxc
	Y6U62uXCIH8k7dV0aHdNcrSPP4irMSxR5hz1aV52BwV4Hue+nxoQSVSHwJ9TiUaBxg4gDjFh/CD
	wH5/X02+jnZr2VGuQlh/TlmkCscrMmzA=
X-Gm-Gg: AZuq6aIpYlt2/P6s5jF1UnVj3OnvbocPZVhcl+Pu5v2c6/tORxx4dm2A02wz8xmV2rK
	AiCI9K9fKR64xTqt9Qu75feGP2uvqrIsESIEWJzOxutg4Xt0gIX7ZFO3gUy2LDdEm4EwUD5Ip8O
	WvVFm0Lc/5RcKskF0gU2K1UmDm9pZelmvR6BPSQnx4XMElm4ryjKmxlEfAUsSqMcOEozmY8GIlz
	qLQPbjuraO1RoBIW3L2Y9vyKVu09NO1T//f0YMcy+GUuGFeVo4Fi+9BqejmnqLQ8hFAoIKXaUP+
	KbmgLOfw/WTKP77sk95dwzgrACgY//GLAitGvA==
X-Received: by 2002:a05:6512:1595:b0:59e:3041:8a2b with SMTP id
 2adb3069b0e04-59f6d3856e7mr6396638e87.46.1771586301677; Fri, 20 Feb 2026
 03:18:21 -0800 (PST)
MIME-Version: 1.0
References: <20260220021353.40554-1-rosenp@gmail.com> <20260220021353.40554-4-rosenp@gmail.com>
In-Reply-To: <20260220021353.40554-4-rosenp@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 20 Feb 2026 12:18:10 +0100
X-Gm-Features: AaiRm53BY2p_oyPXpQmuTbk1xnduoYmd-HBAIjHbep9Ukyhp1dBwRalmjaOrg9Q
Message-ID: <CACna6ry+K6q_JY84j7OjRWALsUDU87mpAiikF7cpUGDUUYhZJQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: bcm4709-asus-rt-ac87u: specify switch
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_031824_703702_2821B617 
X-CRM114-Status: UNSURE (   9.28  )
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

pt., 20 lut 2026 o 03:14 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a):
> bcm-ns.dtsi specifies a default layout that is not correct for the
> RT-AC87U. Also allows setting the WAN MAC address properly.

How the basic ports info from bcm-ns.dtsi is not correct for RT-AC87U?
I don't see you doing any overwriting or /delete-node/. It seems like
a standard NS device with BCM53011 and 8 ports (0, 1, 2, 3, 4, 5, 7,
8), three of them connected to no-SoC Ethernet interfaces.

Except for this unclear commit description, your changes look good, thanks!

--=20
Rafa=C5=82

