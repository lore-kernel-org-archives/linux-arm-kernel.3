Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D971C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExnKAVPk+swRg6enIhEeCZ07HSSnP/eXJ5Jbmt+6Xbo=; b=Lv35nQc5NrVQ6AGjRAgphQh6iA
	sLlcRJYWH01UXbMzaA8DhKxxjgtVfktFnOTD/Itldh6J8bJvXSvfr6O+ckuu2Zwm/qAB9kH+JoJ+l
	D6LOp8PNhZdP2qBIq9tkgIDIyyZ61v6rknzQBUoLciUGlhM2OShWmz+05z7hxM2fECMueWI+sCH8+
	DhRuoCS2pkpjtAupIrvK8fuVIwor0b8i+xmlShb3VsW8w7R/iwp2SIMoNN0jrm0Gcs6qH6a5H4Ql5
	JXxbcySkqMJchFv7XZf8V/nmsLKVVBwxq6YENFGVvZAcjaLQcDeTIvHAW8qmltmyi0DRwCKkgM0OA
	eNoIpTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiVD-0000000A7Sm-0Su5;
	Wed, 19 Aug 2026 15:46:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiVA-0000000A7Rr-40sI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 15:46:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-495502852d1so691225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787154411; x=1787759211; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ExnKAVPk+swRg6enIhEeCZ07HSSnP/eXJ5Jbmt+6Xbo=;
        b=gnur7Goxmq6lnpj9Z9g+bZ2edcMkSMbH+AVantWDX2Uj2qa4G6NTPaPUxbO7oBpDtO
         fGGYHqWMH+f6aHxaH16ZfTxeBHfE5ekWXECj5mjrAcWQxw3Ncm41JazpLaBRjyr+uy2f
         ySnDri5HYamy52/2zLcRnt7l/6AO68Wfj/xNhrmS4ZxrD8M0LU+ZWEvTGoUBmKglX2Xe
         nDGuuN0EbJMsAjWS0cmW+AisDBkkmoCuamrgGbIwMQbi4dKXr3WiUclHeVWm2OuaIbQC
         tZiUEhU6+E4rA5FetWwFEXcrMy2UMEXlceTwdyg4b/ZfOuWy5wxCtsiJIOicHDq1ugpp
         f8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154411; x=1787759211;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExnKAVPk+swRg6enIhEeCZ07HSSnP/eXJ5Jbmt+6Xbo=;
        b=h23akC9QbQJobRDBk5UEbIeZylzQVtmLWlviizwZTAacCmORGYt2SaxszEnbcy5M3/
         iAtwXf8vor6dtQsQ/kRUP3LSZEruMKC3//gZ+i5QznHG4MpPOziE7AiHrrAqAEcDyhxM
         3UERcM2jmADFqRlRl89+sXiYKD4ZgslcDrbcoXKy83t2QM+sWAoB6bDvBWUDk/zwKhu6
         nYdxnjDnW/FTqy+/B+J9dNXDJVv/X0vUdHQ7jT7zPPDTSKk3LFMCUf3z9SOVaiML5kYn
         3uekNQ2YnA1iOPqYZsx0lL/fQYy8Ma+/ONsVIZN5mYzkFECSty2ER4yDVP7ftMZ6MOOC
         E4Vw==
X-Forwarded-Encrypted: i=1; AHgh+RrLPt9aYGCKIAJYrN+E5GMQFz4ptGxU6KOg/riNSWA9qhZpwu3BD4QCsqun0QyrDhaInfJaA+OaD4jZlz0mXMqo@lists.infradead.org
X-Gm-Message-State: AOJu0YyQuFlSypj06QYJaEb/k9/U99lWbhXyjoZ8lkkCByiy4jrhPwbn
	fIjA1ImR1tTMVgd7Aj47cKqE4SnHZTsnflWnya8bN6LGrplUMKvYrfhL
X-Gm-Gg: AR+sD12Lgoqj02h8NBjV0L72gbRUDQN5uc3hphpCgcdC5J/NV7EUdi2AaT7dDSkARZl
	0XtXpyqRTQ7T+hhFcQQxFYaR+SW5gs0pQYbUdSfSmx/Ru+A5/uTLPKR2wU6+OjLHNFSmpSUeWOn
	afhydeBvfPRdJfi8R8E60o26nqn3ofr7cpPzZ9DDRvpr6nefJTNi2yHTjX9EM9jw0qDB0AOU7nv
	D7UilYdMAwVGHPv8IJyvWinDKUGUEsKav5qG6kemUABcKrH/ydJLdNWHGC7If+4AQLA5DBUEfX2
	beODnl8TPJOnBAKIuFUh2YaN4n7jCQUBDr6Ny8jvN5M+ndb7sRb85G35M+KCrWsNKGMBiIrmwgD
	HL2I3eUpXMpz9tI0d7kwFxAsFDenjexhFXGq+HW8kQhtE1c7YFx9wG5VoWfPf6Cp8RK3tQH5sCn
	QJyrbKfdYSDMrzqDAmWAifaTRvjmtV38B3uzbwpd2QF1Rpbdnwr4BSICuGzUShwBrvepxEII170
	TI+Ubl3Srdh8ddWjNFb+eFFQhE0PVyJxt/BBdhX/1RYxdJJSFF0RV8vyRsJxXkfpVbT5rD8T64W
	KXovCA==
X-Received: by 2002:a05:600c:8b6e:b0:490:ec79:3046 with SMTP id 5b1f17b1804b1-499aa0e0223mr56044905e9.0.1787154411075;
        Wed, 19 Aug 2026 08:46:51 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B929600FBC58E6E51BF6D72.dsl.pool.telekom.hu. [2001:4c4e:1b92:9600:fbc5:8e6e:51bf:6d72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9def415sm57189175e9.2.2026.08.19.08.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:46:50 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Wed, 19 Aug 2026 17:46:32 +0200
Message-ID: <20260819154634.7584-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819105723.632029-1-gahing@gahingwoo.com>
References: <CAEWPSH7ETfw2TDjUfOvcVtDm19FC43x2vP=Lh7m+XPOGptnPWA@mail.gmail.com> <20260819105723.632029-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_084653_032454_97084A99 
X-CRM114-Status: UNSURE (   9.99  )
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

Hi Jiaxing,

A short logistics note so you can plan around me rather than wait on
silence: yes to both. I will read what the vendor stack actually
programs into the output stage on RK3588 (your option A vs a floor
enable), and separately force an output below its zero point through
the open stack, so the two explanations get separated on this SoC.

I am pairing that with the oc=56/88/120 sweep you asked for earlier,
as one measurement session - numbers in the coming days. If either
result is going to gate something in your v9 timing, say so and I will
reorder.

The correction itself, with the control run and the paper-trail rounds
behind it, reads solid from here.

Regards,
Igor

