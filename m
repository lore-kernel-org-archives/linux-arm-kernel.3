Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B90F3C98B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTbG2+/qeKMz4OKAW8KVK98vi8Pu0f62GDaMHF9UJ9M=; b=ea7ksoP67/UCWE
	pcR+e8aApthxC7crTOGeC/jey5XdbtAdt1wKZbGnoEu3xNgU/r0bEwo8pgNhJNQMraqNNPyLb0Pw6
	18MxQWQUUB2TmeXLR+ZCOWmX42Y0k4I3lT37C9ATW1ZqUn6qZP7gmbIzCdZCyL4Dyxko2IwizIVyH
	fLqQTwdueM+GB/GC5DCReZ/lBR9mC+lfyFA6KLWG5+cS4JONV4RTIxhbVNaEdy2kk+ja/HBiua4xr
	/ByEVFgZwUDsUhIZd1VB+BDA8GE/y/OrA3KRXJmo74bQi65o33Hdua4JMBFoqsGBA+lEPcN4uoPoW
	9MZgfCqAGKjxKy5ydrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutl7-00000002Gyl-3zyx;
	Tue, 24 Feb 2026 14:51:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutl5-00000002Gxe-0u9W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:51:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7335F4455F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5535FC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771944690;
	bh=CTbG2+/qeKMz4OKAW8KVK98vi8Pu0f62GDaMHF9UJ9M=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=b2nF0inaELbo3nIJYPqR0TbgFBJt/lH15X6b4kdV5yC8rKU7vy2fd496RTugBoT8V
	 Sz0ynyuyya0iXP0jVUoPM8YPf4UVW419FyyAdwhtZsAC0dMxQ7MaQq8oymc1wCjK7O
	 KIM+WMQ7RQ2iPcAGS9iaPjd1/Fb0B5UkgYRW1COtWU9omqpOKxkk3ww2tZLQUNhe6y
	 RMEB6UiySWUzOl5V+MhHhu2HtEwg0US1Yii98UlzmfTYdChrEZPk+wuaAv9f/oVJsR
	 BzpIPCgjOaLpNM9MS/P42JF5Iy7OV7AAp1MQTesdiCiN1E1wDFu3PUs/CHQuIPOtth
	 nerS28dEesGKg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e57973dbfso5516868e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:51:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWY33uf3Wy7Fu0/rj93veGeCVWIKdNzrxqpixbyTsB6C9WoY02mKw94EHkhjaDuXtjvbZGTSh5bOBQMhzzfDBQ+@lists.infradead.org
X-Gm-Message-State: AOJu0YwDEliz+ka1c5/IyHHtGbezyj11D0IdoRPzO976sG+MML/01bbL
	UNiR25skyoPuXuqCrSWEKhToMdkDx60FE2Yb+fEvRwIX5MnNVwNQrh0EthyVs6AOXHes9HX28Q6
	hhbCkyD1pZbNE2NEUNwA3oClAMEuMQ9k=
X-Received: by 2002:a05:6512:3b11:b0:59f:6efc:2846 with SMTP id
 2adb3069b0e04-5a0fe4867dbmr67923e87.7.1771944688693; Tue, 24 Feb 2026
 06:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20260205084037.3661261-1-nichen@iscas.ac.cn>
In-Reply-To: <20260205084037.3661261-1-nichen@iscas.ac.cn>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Feb 2026 22:51:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v67GbsYcHTtqhgPmV-aR+7MsGPAdEWUQgNnWF58QEJVprg@mail.gmail.com>
X-Gm-Features: AaiRm51nAh_B51su5XA5YdK2c0XNwTMbTicJtvmC3iQAXEKLeXb9nFKqg3c7k7Y
Message-ID: <CAGb2v67GbsYcHTtqhgPmV-aR+7MsGPAdEWUQgNnWF58QEJVprg@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/sun5i: Handle error returns from devm_reset_control_get_optional_exclusive()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, p.zabel@pengutronix.de, mripard@kernel.org, 
	mans@mansr.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_065131_279303_B53D017B 
X-CRM114-Status: GOOD (  10.18  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 5, 2026 at 4:42=E2=80=AFPM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> The devm_reset_control_get_optional_exclusive() function may return an
> ERR_PTR in case of genuine reset control acquisition errors, not just
> NULL which indicates the legitimate absence of an optional reset.
>
> Add an IS_ERR() check after the call in sun5i_timer_probe(). On error,
> return the error code to ensure proper failure handling rather than
> proceeding with invalid pointers.
>
> Fixes: 7e5bac610d2f ("clocksource/drivers/sun5i: Convert to platform devi=
ce driver")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

