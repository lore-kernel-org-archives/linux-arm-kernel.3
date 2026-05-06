Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85E1CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/v9MQFgIlffWIKDfvYVkIbMIOBfG0NkHQjEHrpEJtA=; b=sOezMKmU4FNt0RiGGkyqP5g3w1
	iGmef5bK8zZo1MVkCul9qG8eGJOpH1srMAIuF+vvWhNkoSClZk2+8kZAXHmsxq9farrYHB5lsCEmj
	mE8R+JiMbzEI2tJX4P9+r5mwIC7DY/u0mmU5tV7UuTfj/xcpTBYMWsfR/wgJGLbQlssc0KXt4dTq1
	wEL/7apdDOmzEqwUrkAg89bfdm/LjoT9MSMuhlJyGdjB5jM5dJThC2TEkVWJgM2IF3YsJxDjnlCz6
	+QTOWXm2oiedD5SsDmCAiysVRTSR7kASgnk8BpBP/hKawDgvocFZRN2txXQiDOARtn3qY73bfqemr
	odnTBSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfio-00000001bJx-2xXF;
	Wed, 06 May 2026 17:07:42 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfin-00000001bJU-0Cea
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 17:07:41 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1309f4ee973so3490529c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 10:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778087259; cv=none;
        d=google.com; s=arc-20240605;
        b=k6MNqtvUHaw6FVmzxqIvqQTXIPLU+PC8zUbQUyQcfa9mCCoyyN1vkK0rZnrJJi9r9p
         ilMTb6FArSQtVs1ffrUGkjsQr9ZW9vtrc7jm3lTncf1s0iQUpeaSwnT6X3mM7ng5KMug
         mPDiRhYvZa2vGV4WeUOs0Y1Ram4jv0W89709SlOh4dbhCZsv8iJKiNAaLY/9GWP99Ow0
         OZnBa+fl3G2kYqxorDd9Sp7piTmftOQDfnpKCZ3W2ws+mV+RffU9vzA7ELDpDkPcptq9
         39bO14HE9cGTzm3mvDWRr00ISiHRCxIHxY/7bZbxuRHL362sisPIKKYnV2GTeUXlLrou
         2zqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/v9MQFgIlffWIKDfvYVkIbMIOBfG0NkHQjEHrpEJtA=;
        fh=gpL2tbkyvitwYzIbdjwCFiU+BUk80FAlF+F7znV8/ow=;
        b=AHVAhJT08SV+MLSme77qCyjX0saCloCk0h2JZXM1sbBq9GZTQVKQ62qrlMhscg4/8b
         DrAJNtz29qw9XFQ6ZJBvyWpd2ND/1y9+uHphKATj0wWrsWod+ujlhiUyz/0CaylqASiL
         Hq1Etn5v7+4/LfptBZyyFmuDAQLcu3coXuLUIWb3oBimqg+PYpb1vOCzzcuXdv/Chnmb
         S5efvnjwdcPWY8enT2o7KCzCzNHLsHrGajednuF6qkqtlUnfv/ybsmC6a0wYc/zBKKyn
         XqWubRPkKJzvhQz7fsZH2Zxlw2JnDEUQQLyAtrK+ZuAZ3HSWWe72vmGyLBri5sN9G5A8
         spWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778087259; x=1778692059; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/v9MQFgIlffWIKDfvYVkIbMIOBfG0NkHQjEHrpEJtA=;
        b=XfutXqViqHpF8BwjpMFzTWH50Esh6T78WzLa3rx4k8lePFqyaH1eiQx7exaIEYAfrY
         x/b+9NrwEjRarleX+J6f4Bmi6SSesdkbr3DFwReS0ekeViyK5xhPpMGME4C4XBsvwzNJ
         jDQzT0fJxpHYgr3HdCIkJYrmbcnJQBDuY3ZMczo7Uw+mbavKLJCR8obOr6VXg8i0YBRE
         vwZ2b5b5C3qPpjCSQf+NnTvN6hrquG+vqQmIpAxTPFdyAOiajX3yKBPEvOrnPMIvOGpn
         qHNVQ3bmZXm/Dqk3kYOLX6PNdijVEgcqOCRwJzjWT6b957F3Ij3L1UqPutv2iiKMaob0
         bLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087259; x=1778692059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/v9MQFgIlffWIKDfvYVkIbMIOBfG0NkHQjEHrpEJtA=;
        b=rkRUeW3PxqlqsyXU16HqzqReIt01CFYXhzOmhYsa2QpBdzoZBXDb9Ey2DwgUOUESwD
         /+KgZN/cHf+4ku4TqyQZXItDQEzlRUxeOrZbr34wQqFERCHoS21q7kVqdAnqx8OLJ80d
         N9tTa30VUbK3VALaTGT7A2tsdUjJAajsQk/RkW3R9bQvEgJszalfmsPhU6KovZV2PedJ
         i8I8T5AYOkBvBiNxv1Rv6WhCVr+aArMGOwzapFTOlMxRh0gIjVNfmh41d1mc7Gl+cTcG
         eL14E6/EkW19Eqz9dhMnCne0ROdjdSG2YstE/sf1k1CTlhgDbFwQQbmD24Wanm6iGn9d
         nB3w==
X-Forwarded-Encrypted: i=1; AFNElJ+wuC5wVXZ0ujZybaOWJPJAYKX9qO274DDQkUFuQakfRHAU3mYe8jgbABakNB85Ot2PqgT2YnXoK1E54jyOsT8w@lists.infradead.org
X-Gm-Message-State: AOJu0YwDjVMjybx7KwDcK4sWS5Gtw1GVFVd9cvhLi8ogHGRGF8CC6Qn1
	JhGr2F1sSmvzKz7i3u+HYcnofjY6lNYw49gKmJMo3tURb6TXoXAsPSbcwhJQzRcUNEqRYqeLbdp
	ZCy2OUdN9drLWxQSw5ZhkNtdsWDHMv3g=
X-Gm-Gg: AeBDiesY8mw/982+iLJgQenUpLOsz0LNrtvIhc3yZP8B7zC6gNd1nr7DhBjt7XfFmmc
	On0csxoZ5UBuvrL5QFpocXynlsKRn/PCSxwlBEPI2Up9rAM1P0d58BCps5R47TWov1HqLN0OyEW
	GMWKalRUUhZzZkDACULpAK3/gv18r2b0dsP+lOqHgceCXKCybZSqJqnufmnKWHP4PHTye47BR9a
	HgCKb7tpLPrksB89wCKn8nIIjwyvExp4HguLTBrj3PnS8ApY11VXveXGzo+jdN1s0sT18ZFiHgv
	f2EehGJwuDXUyWc6BHPfujB+KiKGt6lRKTUHLfZlwlk0+jcQgndpaXDIET11CJ+DEve2pfZqKxo
	8Cc4YtBgRE+KSg8ekibz73oOwuCPpnByW5PqqZBaNo10BmsMM
X-Received: by 2002:a05:7022:1e10:b0:12a:b932:81d3 with SMTP id
 a92af1059eb24-1318e7f7469mr2001823c88.26.1778087259155; Wed, 06 May 2026
 10:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 6 May 2026 12:07:12 -0500
X-Gm-Features: AVHnY4JssmbmMVgWYy_rr3kP7VA-rHrBRjYoeKWuuDrMj3pK-MCy7FEMX0YQL8c
Message-ID: <CAOCHtYjJRmr5LhRePqaOomjVHb=o+B8-3+6BN89Xx9erwRdcng@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] TI: K3 DTS: fix USB Clocking for Compliance
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, josua@solid-run.com, 
	w.egorov@phytec.de, matthias.schiffer@ew.tq-group.com, d.haller@phytec.de, 
	francesco.dolcini@toradex.com, joao.goncalves@toradex.com, 
	emanuele.ghidoli@toradex.com, ernest.vanhoecke@toradex.com, rogerq@kernel.org, 
	eballetb@redhat.com, afd@ti.com, u-kumar1@ti.com, stable@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, luis.parga@ti.com, srk@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_100741_087929_14CBD842 
X-CRM114-Status: GOOD (  11.30  )
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

On Wed, May 6, 2026 at 9:08=E2=80=AFAM Siddharth Vadapalli <s-vadapalli@ti.=
com> wrote:
>
> Hello,
>
> This series enables Internal Spread Spectrum Clocking (SSC) for USB
> SuperSpeed configuration. This is mandated by the USB Specification
> section 6.5.3 Normative Spread Spectrum Clocking (SSC).
>
> Series has been posted as individual patches for respective boards since
> the Fixes tag is different for each board and needs to be backported via
> stable.

While yes, that's true for stable branches.  Since these are so
similar, wouldn't it be best to push them to the board soc family
headers?

(Either way, I'll be backporting these for Beagle. ;) )

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

