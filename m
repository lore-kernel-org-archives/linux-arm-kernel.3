Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC421EC01A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNHUd0dgYZHbeTJ4zF/IZbJ7G4j074Qy84sj+eAWSFM=; b=oep9bMNa58yXx47hfaY5lpT27V
	DShOoWJJJYBsyvyMMWFECaBKGrX4xTUZo0p9+LxOMa4H32AWJhqooeUkCnJyJ6FiURTavvr12AsQc
	bWtnL0k50tbJ9F7h5qI5r/4salVTpuwoh3bSIIJREE1f3L5LERnslK7HxhfQBMmuME6cgR42Ih/rs
	qblCkp+92o4u0t7fpOmS10UNbeKY79xv8JK9UwG/lai4HyUZODI5ly4zNqGGmR/YwFFOOt216Gw3B
	dW7uXUFW/d+d9iwFN2cpLRL51HFlnoda5MjVnDSDYuSjTIg9q1JHp2k2StQWxxxIZbi/PU/Ee8U15
	pEkgO/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bBI-0000000GKEk-15HN;
	Mon, 23 Mar 2026 09:02:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bBF-0000000GKDn-3Q4z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:02:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87B0540559
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65367C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774256557;
	bh=sNHUd0dgYZHbeTJ4zF/IZbJ7G4j074Qy84sj+eAWSFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Oo3H8yPTy0NuSyqL3st9CCsvedMPGdft50GdIp8JT4klEkj6o66DihGIRdSLvBM8T
	 H/BPM4AshQ/UbVPrfKhQNvsgtV0JrmOFE4OCvwttNeYn4ENvwBHaVbvleKx8YzIHA/
	 lewWnz7G/k4yMNJ7s/BfQBTphChWpqEs85XMDwClCtHfSgbWU5uVJxu+g0WE5IJcuo
	 qbTTwzi1ZWTLMUkMowkOU0HBU1fb56J6utZs8e96+zlM90zowvQ4x0nJZpr290f+7q
	 jnlBxeuQ4g2xgkfxXD7OhFbOTcHHegBJcXa0xnpY4falaeMU/bnOV/h80NVNVk4zqi
	 pxGgoOkSXBhyA==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ad46a44easo3510023d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:02:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgeZmEevrL6nd76pXpoEnOlvbJAQmgwdwz3HoDN7IQUyWOIbvfrI8O/0x8AzleT4hnb1sF0wWjN8zYlNiWhmY0@lists.infradead.org
X-Gm-Message-State: AOJu0YxcbYTf/VEK5CODtLEPKbZZZjbmfL1kfNUMbQyDpNCUyypZ6qG8
	UXJxMCk8UF29zgDsVCFh8YkBZfYxh9epqy7agYMuj4hFPAV8PTN3miJesyOnHG7dGJvp8Let1Ms
	lT3ItsBnRmotqkOhdNeH2jHWmZz3GIdU=
X-Received: by 2002:a53:e1a4:0:b0:649:f002:582b with SMTP id
 956f58d0204a3-64eaa683c99mr8644694d50.7.1774256556643; Mon, 23 Mar 2026
 02:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260317115411.2154365-1-eleanor.lin@realtek.com> <20260317115411.2154365-9-eleanor.lin@realtek.com>
In-Reply-To: <20260317115411.2154365-9-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 10:02:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLkC2h+VWRLh=Rv03PbG8Lca1DuuAAs7Bish=OV7KZmiWg@mail.gmail.com>
X-Gm-Features: AQROBzBCpGWcw3Ira5gAjDFEnKBy5l--tJzRHpH9Xs-JDfdozczVjqRXrnvq1ZE
Message-ID: <CAD++jLkC2h+VWRLh=Rv03PbG8Lca1DuuAAs7Bish=OV7KZmiWg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] arm64: dts: realtek: Add pinctrl support for RTD1625
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_020237_863683_BA945826 
X-CRM114-Status: UNSURE (   8.31  )
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

On Tue, Mar 17, 2026 at 12:54=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> Add the pinctrl nodes for the Realtek RTD1625 SoC.
>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

