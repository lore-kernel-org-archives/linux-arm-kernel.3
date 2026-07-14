Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E3CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXVI837g1ct10qWkXRLUJqSubRz9yvmaXF5e78qaF3k=; b=VHIjxSVSyVhUQBvqKjNku96rIY
	OdOnTeC/0NNFEnYTFjhkgFXEwHw/ScYj5zV/uk019K4/AEKTduJZLsfC3MfmOfrlB4gj7jm7Y6lci
	mZlMfEII9nkov0J2CD3PpFnZo32V+4Km6SHCy5nnnQPk50/bNOD5hRW9nqS624OVWCoqwDWErCvzO
	6AI63J89hT8JEvGL3s8Ve7Ifq4nPtpRCof99ZZYQxcySINR17Zb7Q6CQ+zlty0zCcraBx8SJ2u4Ti
	3llJvh3eFdiOiL6UnYMWC6fcY2RBW3QQc4E9NkMBjSWy30HZ+TR9M4Sem/T+7lp6QwuXt3Y7A33mw
	ahQx0yTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfhG-0000000CdJd-3yqJ;
	Tue, 14 Jul 2026 16:09:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfhE-0000000CdIV-1A53
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:09:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493ba701891so8962595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784045362; x=1784650162; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXVI837g1ct10qWkXRLUJqSubRz9yvmaXF5e78qaF3k=;
        b=RQ2yNyEMSDiJw0KwHmVvwhFCKZ3WdQYTP/83Laztk6miH2I82ySdyQJT1c+1blWhxd
         CJABDr7zOQ9YVlc7ssdrzFOrMLo3N4ps65pxuL+K1eZ8u2yqDVF3ldHV93UkV2dR79MB
         2oBQK1qOdXYsF7cB7vIFI6gqsGFyECLE0ZWxSpYV4TnsqWydZ9clbBOz21pIC35QpA6K
         aqdUJJ1VoVG8gRB8TkNj7puGvmsIrbCOKNnIJ0jLvABCkc7wy/mV29moOTEbxsqERgU5
         ooBKKsQRFlq8xJPl2kfB01Qb+KeOzCYMKvqygfueaBBdHPF08L2n4hmY1w7cbVQaCMGi
         WOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045362; x=1784650162;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXVI837g1ct10qWkXRLUJqSubRz9yvmaXF5e78qaF3k=;
        b=M7K7kWMdD43g9Y0zRMbAOvc78Gqf/ea1DIPzdsnB8CQ8zu6cR1XbR66OFg3w0KlJs1
         t2c1Tcu6oo5JPaonRE3y2nAOisGJYCqaOqVjqz4zZdg2n0XNhwDdkIcqRMNajA+0kvw3
         EEs7dfxbQzHm05oLkoNNpOSgMCDkWDWYda7bRyudcOBsOnczHTV8/P5ZP6CPBWJMxioc
         g/eIb6aYr3h+b6KuzuFC3k444J0fUcJGFt4L36HRJrGSITQ28xJrTQdSbhazDHt+jcoS
         H8y2MRb+uvUzdx9VL1gKDKjhrgNXOvdq/3OemhvWgKcU8KpdK9LleKDx3943WEyQTZu/
         bvHw==
X-Forwarded-Encrypted: i=1; AHgh+RqWorIHNaFlQb5qGoT/gDM8Hrk35arBe5FWwOvyabntzdM5npTR0gBnrS9QzRdx+ui96/wMwOrYHssNsF08uomI@lists.infradead.org
X-Gm-Message-State: AOJu0YxyCN8Rz26AG1fA7nJ2O+7qG9heId9rkve1eON0yRKjL2jlHOCf
	vXOM2ARwfHsJ+4er3t8oBVhkJ12Wom1BrUMRZuoM79hz/5JG1pScKMCH
X-Gm-Gg: AfdE7ckYPBU+ePhVyAouRWbCo4r5+ZdDjdHMRppS+Cvyf5D9cPDax02jM4v1A2FjwdA
	Aw/OpUm8oe5KX0BXIJp1EEWEo8cmO9lqmZQ+l5paWt7OE+bUckkgBaQaEWH9gEWS4m4hu30L+yV
	cKxeSt4/915eUSvp8gGffFsD3ltf9rP42/dD8D3DHqASYmRR88xCUmxXv7SR7SeP+KU2RJ92C3f
	hqCO5l2YdGasr2sFRyla5y6VtfSdj1DO0pXjDgmxQ3NrR7OrtlwKejG6cXhrJjyj/RxPFQ/t85+
	cmaSn/xr+OYpZ/czxX+Jzg3HnXB/VWIYj3DKWZN7nEE9/+pH0tFe3hqCzEzi1NTzvxsxr76PV3t
	KNve9r++ze+3yd4/l5CMZNJnjsNTxxOOX4657oA4G3zboPKxD/2NWphighIKc/Hc+lKOQtgDuNn
	i/27KxJ/QSPg5gGmy+d+4hzA5xScBLHhL3FrhA7cg6SZ9NrQPWEfp85CyAIMyQuS2LYwnqrzZPW
	Tf2kOYN7G6GVnpj0HctlCnG0eJzJVKnwL0bt+ANEJdtRd9bg6TmXKckGjYW5R8XMVYw6EovIhRW
	lpb5GZsv1ThzYQuP8D9cbFez16Fmnq70Tz9lNXKGuZTUdONcDx8G6QbbH6LtYYj23F6ld4FKt4Q
	WhT2h3JkX8cHNL+1wmsXfi/o7QbX0mxL8BiTmoxM6dNE=
X-Received: by 2002:a05:600c:3e19:b0:493:f28e:462a with SMTP id 5b1f17b1804b1-493f87e6ba2mr149120795e9.12.1784045361917;
        Tue, 14 Jul 2026 09:09:21 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-4-244.dynamic.telemach.net. [213.161.4.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2dd8376sm228065035e9.2.2026.07.14.09.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:09:21 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sun4i-codec: Sort sound related #include statements
Date: Tue, 14 Jul 2026 18:09:20 +0200
Message-ID: <ptJh_8TPQY2jXW7OWRlEFA@gmail.com>
In-Reply-To: <20260714151950.316035-1-wens@kernel.org>
References: <20260714151950.316035-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_090924_321605_8A7CF1AD 
X-CRM114-Status: UNSURE (   7.45  )
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

Dne torek, 14. julij 2026 ob 17:19:49 Srednjeevropski poletni =C4=8Das je C=
hen-Yu Tsai napisal(a):
> Some of the sound related #include statements are not ordered in
> alphabetic order.
>=20
> Sort them. This results in no functional change.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



