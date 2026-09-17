Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12495C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GB+o9a7/ALUFm3hEwLKClWS3yWNFMi9GdQLNbpiNa3g=; b=IAjQ1zSE42nNe+JT+bukY6I4ir
	QBOuGNgsXcHp3NlulW8+cli6v0yzAs0tfEACQJJOERwwBT/xw6vwiSmGgbqIc/na7yR6jkgmrFjS+
	1w2du6yrGkjnvIGpZxR2i0EIrq+rZnzwzK0438ZAP4UL9q4f9OR4lHit18tP9Qq5tSPbcBmkuIb6v
	VqOFC5I7fmDE0lcrHEDn3JSNnEEbbzMqsXyud/9EVP97AhYZZKFMYWqjNFk7cMxp8a4tK+h81gSrm
	1k6qw/NkCq7hY2ZsvwfbfMWJEqgSsEv7/ACZvAkBQjhMq8j2P04y46vNjK2S1X0viN0zB94yfG2mN
	d/cGjwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DuA-0000000Bf7u-2b7R;
	Thu, 17 Sep 2026 15:20:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Du7-0000000Bf7K-3lZx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789658403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB+o9a7/ALUFm3hEwLKClWS3yWNFMi9GdQLNbpiNa3g=;
	b=dZcDZ+05Dj2ke9DNGfqQqUsjCzBEKPHlWtEmfzsRS/5fhNm/lbwkaKJ1xA5yJG8u2P+AlR
	f6h5i2L3HicQacz4rqFSYmKTiN5Z+9LAjcI/kbKawFRkqvc60gtYm/ERHPLyUNgwowSMgE
	mqRkgAyVczDs8Ye2sP9wcPd4uRk8alY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-A9lysAj5MdOp46U3lVlKfQ-1; Thu, 17 Sep 2026 11:19:59 -0400
X-MC-Unique: A9lysAj5MdOp46U3lVlKfQ-1
X-Mimecast-MFC-AGG-ID: A9lysAj5MdOp46U3lVlKfQ_1789658398
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91235881828so21647236d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658398; x=1790263198;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB+o9a7/ALUFm3hEwLKClWS3yWNFMi9GdQLNbpiNa3g=;
        b=KwhlVFPTVBbVmBgtE4eee7wVg4rKxB+T6SxcXbgJ8/34miEparpBS3/mOvw5uu4tZ1
         P0FqwZ9IZnBHQtxjgRQpA37TdJQGFqsvkK9NNrDYQyBDbvW0a9AU3wQ8JmE7KGw3zc+o
         /gEDiWpp8IBRFWafuQyUph03oABz/LN5LOMlVcjD/ew6lsFGTYBp3/EmRUgytBLjFOz1
         SfuqPARcxaBHKtLNE6EUdZujJ9du6ez5Tg1Zxe2bhqRXV/xe8BhGlUirIbG+2uyRXg7v
         VbXhY2dbRYe+9qmFN2Uvq8ZfxpqKJJ+iHys5g/PWAnVxksqEFMxi7t5mtyO4LzkJLIq8
         SLlw==
X-Forwarded-Encrypted: i=1; AKwUvBz+00XYiN3c/QZpC5lgN0WY1LKM4QZ/LgT5lAAoGJwv8xnSKyZPFAzcXVAFhTvSLsOaUYv7xmfhVVZVniMndJfi@lists.infradead.org
X-Gm-Message-State: AFuF++n0JJgPYxDnbFzPRsRZf36Pp3LJGwXtuWG2EJG2H91YRC1blS5V
	vrdOKLq7K0q43b6NoTReCHQvzMauhnlwdPNQSwu37f/jVR+4tYWQzHzNJybYUIHQuWEtfK/OMi2
	xXFVPMzS7u84TtcuT+8VzfVVaukFAviI/dHKTFn79cP1nMmkQysrmUerU9KK06bzZVtRYZ69WCu
	h0
X-Gm-Gg: AYBFou0U7yLvRdbCGC+G9wO2XPcA6kjxhMKwpVO8F7FULefQZ9enk8A9sqY6J1Hrx1p
	65dGZVh5l18iBINkY2I1RD1ZmaVpDugfJHlztfk47zlYlH5MuJHO4i0kLgqZd7bYLl+Q3to8df9
	gqbLsNLTd8NlFKF8b8yRPjfDdBp0PJTsl268u58yW1AZr5yc35T8GDkGekBbVKWJrjd0jJsQPwU
	QTRrdsqGAPPRnJG5L5REDCz1gFh3nVKF2siq7qtS9NJCQVTDdYIxJqbqVgtIZxUGmdqvroMDnNb
	YJDCNCZ1bssQz0xkC2J+QT7QU4zKs6WJXR11M2vCGLGXI6g3g5vYBW1o8MTHxslMk7H+nwtMqgH
	uwtTYgWbO5lusoWRoJ5VcY7RnB4erM7eFzNJ0mz8=
X-Received: by 2002:a05:6214:4002:b0:912:518e:aac7 with SMTP id 6a1803df08f44-912518eaec4mr13974636d6.58.1789658398469;
        Thu, 17 Sep 2026 08:19:58 -0700 (PDT)
X-Received: by 2002:a05:6214:4002:b0:912:518e:aac7 with SMTP id 6a1803df08f44-912518eaec4mr13974046d6.58.1789658398069;
        Thu, 17 Sep 2026 08:19:58 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cc99a3sm112666d6.33.2026.09.17.08.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:19:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260912000527.231245-1-rosenp@gmail.com>
References: <20260912000527.231245-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] clk: actions: owl-pll: cast delay to unsigned long
 for udelay()
Message-Id: <178965838714.360090.14541070378650623903.b4-ty@b4>
Date: Thu, 17 Sep 2026 11:19:47 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=329; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=GhNGxMokUfeR99zQB1+878eEK+CdEspBfCwGd+WWdEU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLWsEodOb+q38dQ7ICrtnytw02ZbZM5hFwlOly9ZjB83
 bTAegZ/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOZYsbI8ODp/N58l+OBDnbP
 XvKbdj6466NvutF54qImySWL7T/l+zD84di17bXvo7nP/tQ7zY917J6/uNx/Spzc1eYjni/e/8l
 YywUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0dzn4K6KsjDzVj21vBUooFDp8ksmGCQiLwXAwANQZwQ_1789658398
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_082004_016495_A6C1194B 
X-CRM114-Status: UNSURE (   5.84  )
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


On Fri, 11 Sep 2026 17:05:27 -0700, Rosen Penev wrote:
> clk: actions: owl-pll: cast delay to unsigned long for udelay()

Applied, thanks!

[1/1] clk: actions: owl-pll: cast delay to unsigned long for udelay()
      commit: 46c51c413242870a59f64d3c11df25d6693f6fb6

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


