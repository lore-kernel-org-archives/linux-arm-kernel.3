Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6449CD172B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSFEUNpKLwpxZ1tSep7zK984BWz6j4OqWs1gmb3de4s=; b=tZal5rzrBugGeBtA89yWNUEjo+
	adZc1fJVJ+qC/vx8LA1akqCKxcYvevdP2VlpxG4ZHWqECdhRznxncrZ+N6ma4nuGH0RdMPCVWmBHe
	XMC8YpdDRDTgk01OWc9EQQR37jEgs3sa4o8xwZAWPhaAgJBC/Cu0xqegfy2Bj6sW4eFuEoaOP/fS0
	NVVglJGmUGYbNG1EWMX0fj1H/ukSpMO5x8MsgYBpg0lqOnZSHFa5Gky+s4Q3N1gY26UXZ4Qly3Tcg
	9SuFSQ7YYXSTcFZlCSJQJZ1ReEAtSM/G0ugo/iPE46gUmtuNUA52/W7X2GA7XFvgPH/o5lcMkRm6n
	w0/M2FAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEkJ-00000006YSN-3nZq;
	Tue, 03 Feb 2026 11:39:03 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEkH-00000006YRt-3L4U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 11:39:02 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1249b9f5703so7300115c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 03:39:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770118741; cv=none;
        d=google.com; s=arc-20240605;
        b=Th1r1YOkvKUHGuO1/QbkAli7qMBNPzx21pMRCZAwBve7/ObTZjGnfP16SphgQgFknQ
         Ozl/4fE/1bLqbxKvJTtVUS0IAk63bwmK3PhWSsLqgtbiJUlIlRQO6KEcKwo/+FlUf/Jd
         8q9dSMFo9D3IuItN2Xfa2rVsW6kI2WHe1mpLUSsuvN3sOS3eQrN2Kx5mc2ra3/gXd1hq
         uuTcdgfxwA3C1i3r/O/pzEn3IczgWmeshopjN9ZcBRR23GchubZKdmMQzTgkUIw6g3oW
         /bqG11p6thAJEUymo1gMw6S1cXqoda8yH0+ugDIaZK5NAPCmplu829KXP7thzYbwVmyg
         HP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZSFEUNpKLwpxZ1tSep7zK984BWz6j4OqWs1gmb3de4s=;
        fh=403cIJ2kg4tSIk+7TvYVPkuaXMomYDQ9KZsqD2l99PA=;
        b=ATD8v7w89UQqUydSyLFpuN5dwZrRFeZr9DouOwjYW7FSqwharElVATXSYfgBrStmvT
         MuzaqngyPpP1zUBB7SxILEuqsBjN+8mWg5Qa6gD2NY+GKMpbXtoXL78vtldzWzW1xqs1
         S4aDuwMARt3OHRJ6wel8Y/gyf3QHxshPj0FQ1vGTqNgw9vbkoBcT5Jq2jhlV+fHWRCvC
         FhD9SOPcGIBHRm4nv4lQ01kg5elBns9mFXPM+8X+fwtn2VJUlQmh2ciRZqm0V/Y2Zk9T
         9yN0SD12ZSszZkz2xqZvS98t0HMy5w9SZq+vGeMjypIdMoSeQ3Dp73DLNYFkMG1Y3JRA
         orwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770118741; x=1770723541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSFEUNpKLwpxZ1tSep7zK984BWz6j4OqWs1gmb3de4s=;
        b=h9UOYRqApQcnV9q20EzBA87H4pw6cKNxeg6WIzRplSrDJMtwBGflRslewy/SQT+wk6
         to5WuRICh3ecjccHXcBJHQo1/pEbntWjUmXuAl8tZFSgZJp0hJ8mx79s4ou65Id8kPQo
         aqAFvV/3zOYjgjQwpqptHNgFD4cCQ9kDqjEAvg7jTSoGw/3mTSir52nAvNfPjVOPLBRp
         g/mY+/7qqnvtwEe6mVKXwmkBbHjwEzncn5dn4JwctmcLR+kxZVXYjXiui4evCtUgx+s8
         mRFMmXhMhyRSyGA5Vhe49jXKpYsMGisp+mSR/UcdrkFD8XY2Mleh1i/hH+14Reki9dRn
         RKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118741; x=1770723541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZSFEUNpKLwpxZ1tSep7zK984BWz6j4OqWs1gmb3de4s=;
        b=i/mRfaUHUQ/TGLXI+iT/QZtb6MnQ6GpGgquIos6qQWGpxQki+l9wgRg6Cm9DTc6xvo
         jW79RNctOoJj4XCQuqf5E0QDX6T8rp+60bozihofLOem+qoNDy4XrZZE3LW4eyRIsoPN
         stKydN38pWIJvEr7GF+kq53bFY9nWA768NGjEXPKJft+6W2C93QzX5Ry+asFxQJFh8Ko
         gNf9KhBQxBHVZN7LgKkDeaj9btQkYOzeX0jv9zfC5cR95kSV/0WW+AGPlig7Ec7G7PXz
         ba8pTWPW64vEC/P3VrNrSgLDLQDK+rCAwzG9iHRXSQtDB9JFH2RlXxflMsovKPXz2xI2
         7udg==
X-Forwarded-Encrypted: i=1; AJvYcCUARJQgFPk/xbP0mfDXbT3KKoF8gywl1A5kIw5U6szA9c5nUB6CewPOXC6yMvcroWcjpdgJAudt6b/e0CJ6w9pu@lists.infradead.org
X-Gm-Message-State: AOJu0YxjeWNAhH33zW9Ci9NIAPfcAWvqOir8ZoaWYfdeATmW4Q2yIZLp
	bPo6UEB2FijkcZArd4moAWJO0mkAsmXY43LoP4itCZmsFiSwYHyokx8xmA922rAopJGpCrPhwPo
	FWTZ67GO35/FYhZzS4jMTxoKR3KWH0qU=
X-Gm-Gg: AZuq6aIbUVbQmQN+ePy2v0YQeWjuh2XvgonreQkPZgQ/CSbqqjVeQQHkyXBROdW50oZ
	CLCCDecEAK2yuu+QP4ouBhgGVMEGzKLKkER+LI3UhbNWqLpV3IALrPozTgKg3trhuuCvn4NJWwc
	dU2d/rCIXNXe7iD3zhHzZzvcH7wjquPnJQ2+XG1SwN5Urpib2DCC4L+IiXPV4tVo/NTd0QaFx8d
	T0PIhPobR/hwN+dGZE9QkNKYcg+45JSG5F725/guu3XF0vGf7JuPxg5TNgx2PNA46zP7plp9VSw
	YzzKhozegmlGqFD/Eawy/KjZG/Ur07t7Cql+HQ6BwpToPgSwAwOd9O214R9IuNAFYCZ4pD55vJS
	HaWRiYhy6ydf2X05FpO/z
X-Received: by 2002:a05:7022:248f:b0:119:e569:f611 with SMTP id
 a92af1059eb24-125c0f8c372mr5953978c88.10.1770118740841; Tue, 03 Feb 2026
 03:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20260203100332.915-1-laurentiumihalcea111@gmail.com> <20260203100332.915-2-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260203100332.915-2-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 13:41:42 +0200
X-Gm-Features: AZwV_QhBOKTPtjPqk1VVfZoLbXmghqFVzoBkIlS-QuEoUHDWcA62f6VGa7sfNWE
Message-ID: <CAEnQRZBXQTOp-suG=ppatfyGzUQdeKkV0ZsOYjih=yVjjhTuYg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: imx95: add AONMIX MQS node
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_033901_834738_EE4BD648 
X-CRM114-Status: UNSURE (   8.14  )
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

On Tue, Feb 3, 2026 at 12:05=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add DT node for AONMIX MQS (i.e. MQS1).
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

