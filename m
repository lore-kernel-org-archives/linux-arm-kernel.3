Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4374ECD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mlm0YHGLM0VfFF/fXJEvgkWs1yTQHLEduURYTbkabJ8=; b=Xskrz05fT/Jfy2McpOgcdXAULC
	ROOFoNnBzAoWHGjBaShB/wPIIcme7NmFdhU0rivf0t5kXWH4xybmqJXa57onbcKYgtD+jlI1QD9s8
	i2xbpxctS0604ifUAWPiwKtW05X2mawoMTpqg4Yb3Zf+Z+FmiTrAvnkvjs7Qgz6+1R9VEu8txCjpV
	crf0/N1yKpF3ihEjb2vc1GDK4/ozQHMrmQdlSoqC34Qx4zY7fA9V5+hlXkmrWzmgzwWhP9gwm/UhB
	KZI6ILU90neZ4SefToCGBwKWw6z6OEgKhkwJZl524A2WERWIka3BEKgWNjWWvou/umbkCea9tcAI7
	zz+JTK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJ8g-0000000C3oG-2i2y;
	Sat, 13 Jun 2026 07:50:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJ8e-0000000C3na-1JJx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 07:50:46 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490ac357c55so15447255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 00:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781337042; x=1781941842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mlm0YHGLM0VfFF/fXJEvgkWs1yTQHLEduURYTbkabJ8=;
        b=rO776mKsxGK7pCQ47F4PqwGP9g2fvavcoH4BDgnz5MjUTwuwzQ44GCk8SpBNs8uZ1n
         cqOd+5wkVunaA86pLF6pslVUufE9RjaXC16Bd9IIsLX6kUwP0KtUDcF9rl/0phoj8K3f
         xCjR7+3iRPaqZ3PyTom7s3q74xgsoKIv9rRc/goC4JNH4BWvJaMzEYnza8gfFbZ6hIKq
         cG4g5bv6O4Gg8zLG6yEmMrGaZM+RIKD/WIRh8q+91c3HkkHX+WfDfZIbSxIY1VQsLK0A
         X3/v68gzH2DMFot4DwtlJO94loANDidAJsybHhejljgHqLb1N9/8ECHMdSfQBeICY3mI
         R1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781337042; x=1781941842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mlm0YHGLM0VfFF/fXJEvgkWs1yTQHLEduURYTbkabJ8=;
        b=hg/CBMPOEqtQeZb1qd8hL43jkpcxFk0OwbgmCNQ3HITQGROXXksBcBXCpgDw7Ju5en
         Udhqbyj0LdWXYFrAzIW44XZZtrb0/FA51AlUnfQcONYwunAcP0FKxop8TfENYxpilTa7
         Y0FAfcs47JhSyGLu63xMqTFiST8ycJbFYQ/JQJgMDPNTZ7S6CNcNdAoTmVN0kYseDuC7
         EcDd8BQEZQTagCZGuxtFycsclVyc7ty0la6iwK6Yt/QHf2twnvL1L6QLnD1T6TLw/I8/
         k1kBZswukLGZJJm+EnVKtr1sTgX5X+bkGikZgF/fWE7Zlp0syRc/l5WipUn8a/cOmQCw
         CDnw==
X-Forwarded-Encrypted: i=1; AFNElJ9wGtJ9LkULiLewNls0qJWEalLZVsyTjlEZ2u1IRQBHg/TKZ+ZzM32fN2zaIRXLpYrbQ8oPfPFJL+pJkodWSRwc@lists.infradead.org
X-Gm-Message-State: AOJu0YylFxsbo8xFMpEePuWbUMXU5G1iiCVA8Wx4Ys/KuKgi+H4MRDbb
	xroxntSZgX2D9m8AaPlpe1cK9INNpyvxjfnNJylEaBIqfxRGk0Zh7eSu
X-Gm-Gg: Acq92OFXA6qVf+IrdjsWgvUNai2NLR/SuHLbUo8fna6NZaEx7zdsv9OAvsXMcbZXYW7
	gKZJTO9cyURDjLYV2dFWyZDuXrYqPIaC2KLiDiMjd9aauWK8Lgs/oof1hIL+vOR/PgeouBjRJX/
	LgEfTQ3W9nwOVTfHD8egiZP7z+DXF5r4cB3372DBdl5KGr7RnzFEavhPDFw0C8pYDRATnnAUnbt
	5UAdGwHfqR/7O9WeiJFLKF0gOdwQqUc0IhBUCZS0spsmQevoEfo6964L/gxHmQfnzK2gSfNyWqQ
	cOGDSylWyTk1+ZL0GKW2RKE92WzEeABhvkoPPpeg9if3hcpEAlRChROqJXv6osA9fhzQJV4TPFB
	OmXkXydOL6D86nvoEAR6br1vvkN4FPLlH5gppM3yh4Bt+0SzNu+gggq/tMsGTi8E4p3ffk7Sc6H
	ZbcVapZkgZ9nWBq+3hsAH/KB6MFFTzoswhFVzG1mTTfGWz
X-Received: by 2002:a05:600c:820c:b0:490:5cd8:d213 with SMTP id 5b1f17b1804b1-490ec4d3407mr76769065e9.15.1781337042183;
        Sat, 13 Jun 2026 00:50:42 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4a128csm145232805e9.0.2026.06.13.00.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 00:50:41 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 Wentao Liang <vulab@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: fix refcount leak in sun4i_backend_init_sat()
Date: Sat, 13 Jun 2026 09:50:40 +0200
Message-ID: <p7BkDUOlT8udh62CkXD6NA@gmail.com>
In-Reply-To: <20260607030950.83636-1-vulab@iscas.ac.cn>
References: <20260607030950.83636-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_005044_380997_81F3FFE5 
X-CRM114-Status: UNSURE (   8.97  )
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

Dne nedelja, 7. junij 2026 ob 05:09:50 Srednjeevropski poletni =C4=8Das je =
Wentao Liang napisal(a):
> When sun4i_backend_init_sat() calls reset_control_deassert() it
> increments the deassert_count of the reset controller, and must
> pair that with a reset_control_assert() call to decrement it.
> In the error path where clk_prepare_enable() fails, the function
> returns immediately without calling reset_control_assert(), leaking
> the reference count.  Other error paths, like the devm_clk_get()
> failure, correctly jump to the err_assert_reset label which performs
> the missing assert.
>=20
> Fix the leak by using the existing err_assert_reset label in the
> clk_prepare_enable error path instead of returning directly.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 440d2c7b127a ("drm/sun4i: backend: Handle the SAT")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




