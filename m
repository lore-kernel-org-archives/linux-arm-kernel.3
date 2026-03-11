Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D661103E2E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 21:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWwccrz+jcvc2B7e3xb1EuT+tuw+SyGt9jKUe4UvaVk=; b=QsRBSb3SCMyhna94GOFjYJyAJt
	V7xAIFCtnpXAQsWAEUKSegk67KtXYSSB3mjhek/dBCuSvVLC0jdm/iBMfwh5jca26XuM7qk/kN5k6
	17BsKgw/ldofnmdLen7XRdpmVCn3TOnb5UrhIaWv2YusshPCgrOQLFUCn+SuFTzubP/YyCP/uJWaq
	rIJkd5t2IosfFLMMoIHjYZoWbWDC/4w3gj/5kmvNXfbYWqP0ro+oR99njEvL4paI8hStspzYk2M3M
	M2vwRC9c2P7u4DahwuqnXYpPGxPLkqY7FGC6a1VR6MF1Em0I8nj5D0EdYH7Cd0N5EleWnR8EVh+NH
	1Wa2q/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RPx-0000000CZ8Y-15uC;
	Wed, 11 Mar 2026 21:48:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RPv-0000000CZ8C-25qt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 21:48:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58C3760054
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C734C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773265714;
	bh=4d9ICQgMGn737lFng8zTzekpH62ZVrTTn7Jw6FV4RTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aux41JIacmvDLeMC6HzvPVxav0Spw3zjyoVHDO8umpElfELTYLNrEYkCLvX1fe/un
	 jtWhYXCBEvUXkWSgMMX8y2LZicAb8t99OZEwFQ/YJkR/yMfQASZCPbyNHQ5SDZ4NQ2
	 9JmtQXxGb3V9nO8P6vQjbXpHaNVgfLPhkc9RVraID2cv0ngW3iAXOw4yxoTTOJSEP6
	 UK9OD+a2KFfpFIxs9eiGynufn06l3BDJUjSVYuaMKMEQTHuS8FYiMqDm3sw5fb7FEg
	 xDM1RVE/90txtbvJxgU/ea9Egk6p0KfJiHlJG/TWEZasm+p+8Huj0x73b6TFKw3xrY
	 geA1r/WPHwtlA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79801df3e42so6425517b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 14:48:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5t5nK3eW6JJmAeL34lcAXgFx5jSoWMK3NUS7r8+ExQ0ElTF8QrQeBNQQeCaougmSbwCQ05RFTHHzQi4ddjcDy@lists.infradead.org
X-Gm-Message-State: AOJu0YwUJRtUxgNfv4Vx2CoXdQu/7ECiuvH81bDRHA7RIqvAeBLIBDbo
	L8j5MdyOkgl4DbatFGLJ9lXTGxm+6sSi6ZD9IsL1X7o/qt45TcQU9j199dHr81av84ytz4jgVY9
	++6PAHencruWs0nxdDkhLsAyfbxLWo1g=
X-Received: by 2002:a05:690c:c4e9:b0:794:f400:2bfb with SMTP id
 00721157ae682-7994758407dmr13266347b3.26.1773265713464; Wed, 11 Mar 2026
 14:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <b58462e99ab76971d94dcaf973bc947c7ddb624f.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <b58462e99ab76971d94dcaf973bc947c7ddb624f.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:48:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLntWDu8V_55DOeaqQpY9EXXwszM0j_uOrpm+-nPF+vScw@mail.gmail.com>
X-Gm-Features: AaiRm52tePKqRlepUz7lGoGWkNcLkq24xiJuAqlewG6WVEATyHcSNtsT4I-t3rs
Message-ID: <CAD++jLntWDu8V_55DOeaqQpY9EXXwszM0j_uOrpm+-nPF+vScw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	AKASHI Takahiro <akashi.tkhro@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
> be expressed in terms of ohms.  But the pinctrl-scmi driver was
> implementing it the same as PIN_CONFIG_OUTPUT and writing either a
> zero or one to the pin.
>
> The SCMI protocol doesn't have an support configuration type so just
> delete this code instead of replacing it.
>
> Cc: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

