Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC4DCA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 14:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66qeQFvPa1OLNzA9zOG/eSFE0YAdZbwXEI8cdDv4Aes=; b=Dta+NtIX7CX3lc
	7AFn8AeCHGXBpm/NEsP6zxMrU/+cny7WaALQMSsK9KKrZltfdmCzZJdBjonjxvrv8OjJDJpVXRWuv
	c4iBAG5XXJCkB/6fDakUqcMNj9y0Dr6m/1b0SGcbmjEOYJtF7AAczaXkODOMfNabmuskVSezNwGs8
	dUaKxipbG/W54TqvPdy3sleFr52uAxJnSrEh5zdm2Ql/EtYuZqxj12QBtmwtcs7Il87D1ZcwsC47b
	KowZ5Sr/o7GwbjHf0PHUNHZIog5QbBDjhLd3qwlA4+IuD1mmGaXAzjzTUCcAalsiDOwO9Nwby2QhD
	QVH8ldLz+7S+tUoICAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFuLs-000000096dF-3Obi;
	Sun, 11 Oct 2026 14:16:36 +0000
Received: from mail-yx1-f42.google.com ([74.125.224.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFuLp-000000096cL-0qj0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 14:16:35 +0000
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677bf06de21so680257d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 07:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728192; x=1792332992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66qeQFvPa1OLNzA9zOG/eSFE0YAdZbwXEI8cdDv4Aes=;
        b=wmDo9qbR9ojx67tQcSp59xIO9kATkn3vdnkewlSickhv6QlR4Mv3giGdHIUEzqMPQe
         x+OPNO1tTl/WVi4G0Oxtm1ks9RvOwmvHyH83INDnyzcw9cvRDeeq9tVWXk7ofwe99dIB
         iSAEG8foG5kcRglQbxI3ZRBcZKmnVxmXMlnpTuqKS1r2PF3FuHL48EcYODcT4llQ6jYh
         IntNauY6M7wVvUYjBGJn0nzXFKiEVZKmTJBWXQMIhuAXv+dRoj5lkqSZmpw3wr32fYDQ
         Cnty6dWSgSJarbNavz/fNFjqZVjY6zO59mDbqVVYT1pRQPxCoZfsBgoC9gCQ5o6jZ8cY
         Mqdg==
X-Forwarded-Encrypted: i=1; AKwUvBw6uTXV9Dd7/bPizy6RMRkSfi5oHq0oo0+ZdFU7X1yP2oAkaP9QiABD7Qm0QUntTJnHfC1bA775NRBCnnd6zXi4@lists.infradead.org
X-Gm-Message-State: AFq9FYItQRe92m27VGYJfb+biijJz/OdXM50AcvN1XI204LCtD5FRuKz
	2V33cSQcDmO7rKAA1WdmPc01z5JBaOXNkYqWMcyZg44eaAYjh/D84HRZBp/XMIYG82A=
X-Gm-Gg: AYBFou02pRw0FaZnSwpKEEgWBfz31M5wCTz3hGjiZ3xik0JKAYhNOBut/MgHK9efaI6
	QMUJu4NVM3Kp3KBj+4ROV9n7n6l1qe2uucSaFYwSt5DZRJkVrMcVH4tUJ/igZG78gAOMP5b6Ntr
	ixkNsbLleOYrC0oIvlu+Sbu+rg9QqhtIZHQurp4KfeppsOtvOajG8ZhqMWpt3QpYeEUsZHPBcQF
	IOP81BPbFiZFvJYagiLxRgn4C49n5ZooKtzMQHoP4C+cSZcZV7OGvdCo+LfOKltTa7bp6Nv37KU
	yZNF5XCyGQWgvHyuoZ+BRv3tK9Rs/5HjAC2Vq+HToHlDSy4a6QZUMV09q0cfw/soC6sXvnmn0LE
	KazThn5LZfGZvSX7r1aY/izKZXtdlBt8ZDcmoHDGeanL4B8mwaZzoAVn7W3+cEvnjk5MWM0OF8U
	PZLa2lyswCQHM2+EddOkOqh1QFJSK2bUfxBp7h+EnAI5vBQbAzIBol/rBTZEvRWnjG3z6uztmwF
	sg3cpxNhPzo1biQ03vI8myMJVJIHn+8lxgfroASLz+8QQFS/9tEo+XIKeOsiOCzKus=
X-Received: by 2002:a05:690e:d0f:b0:66c:e0ea:a25b with SMTP id 956f58d0204a3-67935ed8c04mr1876859d50.1.1791728191683;
        Sun, 11 Oct 2026 07:16:31 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356d60f2sm2707649d50.17.2026.10.11.07.16.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:16:30 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b056d58f2aso6106657b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 07:16:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjhkydhhXiSrL8G8bwmsP6mzTX4LyLLzOzq9YzgX5BvSBnVURUSuj/g28UajWZfS+AL0iIA0961AAvjyLrqLZX@lists.infradead.org
X-Received: by 2002:a05:690c:a78a:b0:87e:2404:45fc with SMTP id
 00721157ae682-8b07ee0119bmr12804267b3.53.1791728189975; Sun, 11 Oct 2026
 07:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-2-tanure@linux.com>
 <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
In-Reply-To: <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 11 Oct 2026 15:16:18 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
X-Gm-Features: AclHuK_1GqFe_9xMchzTuN-zUjY9-HZS8dq9HbxopbZkfG1FPjpin79NLsfNCvI
Message-ID: <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_071633_275037_071BCB64 
X-CRM114-Status: GOOD (  12.60  )
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
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Oct 10, 2026 at 11:04=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Lucas and Conor,
>
> On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +          - enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +          - const: snps,dwmac-3.70a
> > +          - const: snps,dwmac
> > +      - items:
> > +          - enum:
> > +              - amlogic,meson6-dwmac
> > +              - amlogic,meson8m2-dwmac
> Meson8m2 dwmac reports: User ID: 0x10, Synopsys ID: 0x37
> In case it helps I can submit a patch to change the Meson8m2 .dtsi to
> use "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac" - then
> we could move it here too.
> That leaves only Meson6 with a single fallback compatible. I don't
> have any Meson6 boards, so it'll have to stay that way.
Hi,

Fine by me. But I think it is best to wait for this series to be merged.
Lucas

>
>
> Best regards,
> Martin

