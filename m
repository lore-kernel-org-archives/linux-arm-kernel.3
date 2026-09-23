Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2D0C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLk6o6UAGSAyPrMGXPvZEKdQLnv1x/FQZrjKDEESrwE=; b=3aSJotiixhbFI9KnP8lwAIAqHT
	dQFHl04LpKPkXmsF40zI0+Qb0v9W8F+KjFmkwdXCuZQfbS+fXWwPfP7Tu7nn8zZHS+2FwNuUIc8jH
	4DPHMcz6h+A1tkDkdfw/WF0gT91H7XchbZF03uR9oNs/pC9FGshW7KvkL37zbXoTzyc4qtv0YlM4m
	AwW0/xaNcI/yeYfk5ZYUGp5Psof7E/vY0Uk0xPakDji0YfysAT2mpgMFGOK9RySni9Cc5LVxwCAzb
	CwpUdR5vxWx5PrR3x19tzxYKzHXPehBpQcNTWa3RVaZHRdkEjgOFptOArAmbJhJ+FM0HFk4u5Fo9K
	duuCUrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9T3W-00000009Myd-1SXM;
	Wed, 23 Sep 2026 19:55:02 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9T3U-00000009Mxb-2jBH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 19:55:01 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485843116d2so161075f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790193299; x=1790798099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLk6o6UAGSAyPrMGXPvZEKdQLnv1x/FQZrjKDEESrwE=;
        b=lMhMm0Up0Sl8UnbJ2dMK6gsUDEKxMOmxKhSuNb0CZWdU7Fr2FqkZfAAYRJ7iY1IC/i
         51j87YDORTnPWImJ5j2+MR7JxgfAOhryj9KK2GjadLm4ljk5LfB+Qd+Miny1sVxd/oju
         XXWFRf5SHThUTT3nE33hpxw0RxWJDhax8lkZPkvWAp0q+XbzvXT6gSaKZChfctgH5iCJ
         2pT02cFAjQKKu0JkOkIb7BWn3q5YLHHkTBE1QGH9Dr69IzEvx9063XyBS5uDjHB/JzkL
         QtuSJDvXosucbBXuUAdCO+47VwLJiMqGHCQep3dPQKnFXtivy+AKKafu9orH20ubfu6S
         QbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790193299; x=1790798099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tLk6o6UAGSAyPrMGXPvZEKdQLnv1x/FQZrjKDEESrwE=;
        b=BtAFxKfqWI9G/8j5ryFLZhv819W3uZe3ManPiFCAGNVZY1/4fXVffGKhBRK9qADLBS
         c7HKlI4/SIV04e/MncpgffTfUI70bjwebQiNmbxUHZGaGJr/+g5Z4F1yCRbBS1wkWSyn
         v3DkxHT3WccSWFCXLjBd+jU0BZEcKrF1wehQFOxSNTzS/OEiDhgQNAt5RInhclMaoeXa
         PbhCP1BS3uDxWFFzddxn0ekM7sD0uwJlOLPjsa9mnj3zls/3L7se45dp3fzmiIfi7Dnd
         knMGhzCNb/kpwcf4HXhoWEr/df5Y5g69uXYX9ozgRNwTySZ6YIEgD7H99wZwr13jBe4F
         ATKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyPJ4Rzq3Mc9jFyfDEFAsjfoKhD3fGGgcEoiC5zm+gkqikzJy+BCLRlNLqJKL7bzYfEa1ar709uX8mgMRpXVq2@lists.infradead.org
X-Gm-Message-State: AFuF++la/0rcvalE08Wecq6vtJ4YtvyexoPhQItsjEwDwTsUxeN2In1U
	iHRr505PuRkzCtjUGv1fhZJbxt6/iU4XxRbySViYwlpEfo4RdJsdXok9
X-Gm-Gg: AYBFou084QE73HbaN/VbV/l0ro4CJNsGu7ZtBm32flW7OX2M3NEE53I/SqeTM1htURy
	ZbUgTTwFNr1jwaJTPQgVsJ6vr6Y0emF8K3z+LmtvGJ0pRLA8Mb02K/t7To7i0++mW66JUD0Kahx
	iTc9iCmrPwF3SSsFsN572/30oPaerNSpHaeSLAEdkY58EwJsJvobqgIZYX6cwu7UxuALiQLEDVj
	EqstWaxrkask2AxWn780rI+z6Yny0s1VQ8C47hY1M7LTiEHpxCD7mSsSISisaPK2aHmoRSkO80O
	BdK5CziqZ5XMkaxTUcj2d6vCtEOpD3uphMzNRlQyCMdB+QX+jXLUOANdM0Za+XlAcXsYo0UTD9m
	NcaH4bE3Gao2Jka4W0mkC7nNX80a0bBOhvIqfLDwb4DABl6GU+tXfjJL0LbRlo01evnBtSaRdM7
	JSQwD11JP+JzG67sUEKo9q77lwkMDBq8FxA5axDKpCNNaCzzpFT/spCxhvXmq/NiNvQ+DPK25Lg
	o/9Wxpts01znPjnxyT8MsBNXOn9Ly2CCdLMbqJRPasOtI+F4PqjlXHbmWNxWEl9bLu7xqXBTg==
X-Received: by 2002:a05:6000:2083:b0:487:a9f:4fa2 with SMTP id ffacd0b85a97d-488716ef593mr320372f8f.1.1790193298626;
        Wed, 23 Sep 2026 12:54:58 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500007AAF7E1F4D006B.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:7a:af7e:1f4d:6b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm8592627f8f.30.2026.09.23.12.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:54:58 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] accel/rocket: DVFS for the RK3588 NPU
Date: Wed, 23 Sep 2026 21:54:23 +0200
Message-ID: <20260923195423.10244-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9cc5365470490b4b66364e60fb614ccda7e86c6f.camel@ndufresne.ca>
References: <20260922080114.44662-1-royalnet026@gmail.com> <9cc5365470490b4b66364e60fb614ccda7e86c6f.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_125500_728209_9DF4D074 
X-CRM114-Status: GOOD (  11.35  )
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

On Wed, Sep 23, 2026 at 03:29:49PM -0400, Nicolas Dufresne wrote:
> In future series or update, can you use common formatting in the future, I find
> your changelog hard to read. Do something like:
>
>   Since v1:
>    - Changed patch X with action Z
>    - Fix blabla
>    - ...
>
> Its actually good to be more concise in your communication, "wall of text" are
> difficult to cope with for maintainers.

Thanks, noted. The v3 cover will carry a "Since v2:" list, one line
per change, and will be shorter overall.

Igor

