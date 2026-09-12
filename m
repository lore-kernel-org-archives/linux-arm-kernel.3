Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3A1C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 07:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTBk2CBRDahK1Lh12GNmBkGqI1rSJ+RuEfJVc5A7eMs=; b=iowldBzrJumjIp
	ur+FgH/JU2TgLbEVWfmJvoAzpaD+a0X8u+a02Y44J7mJO07vGhQfUOMT321wK4vDcxYx0E9gRLwLp
	kgpPLj6YSVJyXfxg+zVJdourRphXnsiyjctSpVDxP0jJsL7nFLSapMXsZhmoNZNs4eG0kFK9xXy/s
	PjINJJsb92PmEh5e5YWpZyq2ift1fiY+nZQXKEN1uoyGtsRMKPYIhe+uApREOPMWSfMqjBzmPq5o9
	aGvOIBGhrr63EovnfLplXS/dyof7tKJyvRxXt4OPv7DKo8rVg61xDOIHxnu9qxgGPAkev8hlEAGmN
	BvEi86Tk6/lvtaCgRZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5IVO-00000000fKw-0Qk2;
	Sat, 12 Sep 2026 07:50:34 +0000
Received: from mail-yx2-f12.google.com ([74.125.224.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5IVK-00000000fKU-2YrJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 07:50:32 +0000
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4ddd17a0so5863997b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 00:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789199429; x=1789804229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTBk2CBRDahK1Lh12GNmBkGqI1rSJ+RuEfJVc5A7eMs=;
        b=rcehF9RYcwiq1Yg2bOz6yR1CBCDc/k73HEJXOoFRudhU9vx0+U/24ykpbWi0OGcmCt
         FxfqcpZDMOkq/2Kq761dh4F85YyydIuBlHdXWxKEZdO4OW5EocyGs8mC/BdMjoI30o6Z
         fCRUA/odiBATkAFYX8Ez+fANiHBX7/DSe3cIlfBd0HqHj/dUItUoCUea2knCYUU0KDlA
         jZwyCqx+A5wMBiWXqSGXAjXJjnJkoGcfj+XrQ56mfGZLqoca8MzE2gthoCWak0kjV3wW
         1aPBn0dYOI7jIm5qwcH9gDBHY1ec8C2RiX50AlvhlSOk3eIWohLNvQYg1v5pGQqN10Uj
         BGQQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7ISmcGLkOEj6qxpb9cOQm319UHNTx3KAtyStVWX0ajim9XkZ1sw6EmAcZ08KOHmaMNDTG5ETKrieTMiHJlOGA@lists.infradead.org
X-Gm-Message-State: AFuF++mB+J73vzB+1i563SYGaC/f5gUZ7RV9+Ph0l3JNaiHpAIMvz4X/
	yoTsUzYc/mlqNMo9LPrz9dnTS9IlxBiAULSHlbKVhYqPP0d16NYCyJ9KTa2971Awf7s=
X-Gm-Gg: AYBFou2g2WBg4hDsSRy5Q9HwbRF2iVZC27pSRiH1GEgA31/FzDxY9tpI89W+y5TUsD0
	82+4AZce8kcc0Lzsp8oEtsWISf4iYv1fEzmSxU5lkj3UfB097RUIPjnwiyBohuuZNSAy3f/KNZe
	6aNSjX7/YSa1AHvTMCSI28R84sNEXkkWtMfWHp2/tRTT4Ne3uiqLuylH/F+HS+zRH5Vqxfu5hAq
	TeEuh9Wl028SQ9cK0vLH/pykXAVK9OmabfkixNTt9bvB6g38hJabCeRzPD2cqJRs/V8/izbWAEo
	JPMQjsD6lvYE/gw5B4c8LCXCuGl1ZpKfklewF89DPKgyDY0hvgI7S3i85aCpLNLRUV79UzfeHSi
	eYiqTbwwuskEYH/aZ/TSOMlSRRJCDWFW9hbayx2y1KU+HxOiN7NyvHXEemkLUKetkd5jVX5JlOj
	l5Tt0UiO4gT8dTLo/eF5D/wCNDeqQm8OTcVXvTLzmeVxHy5VbDqqs8Unhnj1+XtuKhUgp9lQm4P
	/qul8rbz75hG9VMjfBgJ4lCTS6sXgMDeJVy9rqFtXqMItEKov6F+kxVT7uFxJEc
X-Received: by 2002:a05:690c:e295:20b0:87e:2404:5c46 with SMTP id 00721157ae682-884afc1d946mr26684957b3.12.1789199428869;
        Sat, 12 Sep 2026 00:50:28 -0700 (PDT)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com. [74.125.224.141])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88487ea38e1sm19215387b3.30.2026.09.12.00.50.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 00:50:28 -0700 (PDT)
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85e68bdbcc1so4759057b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 00:50:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwpj1LUsnBWmWX/doFEc3je5Qswtf4XDx+NNrRDdx3UYPrRYHP3eetMysySlZuyWIC1zg0PSyRqwd9zsE4EZ5Wj@lists.infradead.org
X-Received: by 2002:a05:690c:97:b0:81f:e85b:f9da with SMTP id
 00721157ae682-884b4b01ddamr30061107b3.33.1789199423193; Sat, 12 Sep 2026
 00:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com> <20260905153234.133217-5-tanure@linux.com>
 <aqSX-kUvYaixESxe@redhat.com>
In-Reply-To: <aqSX-kUvYaixESxe@redhat.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 12 Sep 2026 08:50:12 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
X-Gm-Features: AcwNN1V-hZOzugyfoJiJeFS5rmMdeoAyBQ6wZJLEfk_Dvgzhb0zC99WtQCvbVRg
Message-ID: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
To: Brian Masney <bmasney@redhat.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_005030_685295_ED8F75BD 
X-CRM114-Status: GOOD (  22.43  )
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

On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Lucas,
>
> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> > identifiable consumers - the three MMC controllers - so marking it
> > critical was the wrong tool: the clock should be referenced from the
> > consumer nodes and claimed by the mmc driver instead.
> >
> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> > have no single identifiable consumer.
> >
> > Assisted-by: Claude:claude-fable-5
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> > This patch depends on the MMC controllers actually referencing the cloc=
k:
> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> > clock must land before this patch, otherwise the boot hangs and memory
> > corruption this clock caused are reintroduced.
>
> This series should be merged together in one tree? Which tree? I can
> provide an Acked-by if it should go through the mmc tree.
>
> Brian
>
It's definitely best to keep the series together in one tree to avoid
boot regressions,
but I think the clk tree is the better fit since the core changes
revolve around clock logic.
Could you accept it ?

thanks
lucas

