Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39884C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 18:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pp5J0jgzAEL526K8MSIBx0JpzYWE+QXYN3SwjN7BJQ0=; b=Ko1uncrSZpcOGgRBPlvT6du5Qh
	YgbTQb6W3/yYCNtcVJ9UHU8AWbA+kYBD5utNHfcx9bzaXp/s0b2MS/wbbBvwaZUiuuKJMPTH0M2/5
	JS0kOmFo5d9E7rqhE7eV+HSu8GqA+a+WnFeHjW3KbK8va9SL9fD6zPWnd0bzGx2pvKM7bkOK1COOQ
	Ej9EFKzNifXZ1vPdeHd3Q/m1MW4ztUOYOJWP+Kvm/DAsdX9Xpq6phFRapaPd9ImH7aqCICZof1Tv7
	qDRsikUR1naGxeN4BB58+FF642RBrQYpvG/PD2IGH1fQ8Fb3J2Km+PvEIxHAeCOE5nb6+URsPElM6
	+EL+CwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7rH-0000000C4aw-2rUB;
	Thu, 20 Aug 2026 18:51:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7rF-0000000C4aG-0HGT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 18:51:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4816084e128so26886f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 11:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251878; x=1787856678; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pp5J0jgzAEL526K8MSIBx0JpzYWE+QXYN3SwjN7BJQ0=;
        b=J95u215XqUuZ68zVRhDHiYkJAP9LaUSF+lZBkih6tAnIgTijZwsdFws1XE6JXzbHpL
         JxrffoGdXRpJ79g4+cissV2bnXu3vDCqroETaw5Xs+L6bIhUft0cva8DVL1YziX1Az9B
         Gxo/2aXBost7BWgOUn+Hc9f8TeZsmu5udy1ri5iU24afuDRImY4b5Xyri7WNELIpvMeY
         55Mr0dkeLUqYUHh982FMWZItm87dGVRenb7dqfIwkxkb6k3SqBmF78ALNFhkpdVhGrLW
         Io+3NMAOWNqZg3bNU1DbYd4Z2uX3x6wmf0S6k+ktlbHEOz7+wkRiHgY/UiP/3E6SP+8Z
         DqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251878; x=1787856678;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp5J0jgzAEL526K8MSIBx0JpzYWE+QXYN3SwjN7BJQ0=;
        b=KV2qvuNeVjjgPXUaem50PUr6BOSIS6a0qOyDJ8v4T5X6f4CPaIY+ITlADRdEsLXYpD
         BB8tAsglDsuQFTRIRImC5TJ6OISWJ+m9xLlajTJUtat+1NkLsI6Vrz+WBS2vlYB17JHO
         IZix2GLXCKwXYDYLEpZkWfnvbqhGj9eBng/huiv/gT1MA+/dbsB+fMzQfwjpSnarfGGs
         NALRZ2dlYhH6WKWw4a4s9anuoOojg9u1SAtxOenGo7QtO3lAoLfZ6jjiZoI+wFI8b7hm
         7yxlTzMJgKbnJ/IcJJ3Jia1lcB8pjj1kYVsihmOByVC+ZsLhvkoholKTZ/CRn7AExByz
         zBtA==
X-Forwarded-Encrypted: i=1; AHgh+RrwEgumNe4iLWRe7kmPa2ntGBBT3Uh/sCQDkW9xJMpI0EqfX+V5nETe6jKyuxYOJHod+QRqJ/1P+PbiIztV5M41@lists.infradead.org
X-Gm-Message-State: AOJu0YxZcffIk5S1jCeGtM7u8U7TJJGBbhceQLnqlUjx8R+kcS3EupCO
	0qLqYlmIuo9kxx5olhNBC/Gdhb6Umk9xek16opOEbIO93+wVg+58MFos
X-Gm-Gg: AR+sD11uY9LB32V9+3XLHNtNXemozFsD6l/SNAM1/21x+nYKTkqhwAIUqMNbFC07lfn
	LFNaqqIbDKp9d3QSxRIY1aVKvB2jMcZzMzIdA0bNDfSaFzxakRO7B9bgQCcbUufS/hZvwgZnlGx
	IsFittg5MyQzn712Fu/UePPP9neYPhC27tUzD8OnC1MjMvng+yjrtXZHd2DT8XpAKpywWU3lgKF
	7vKinUwWTzqDZ3+CVc6UoMbK4mZ9Efnqn75YIFLVE4DxrODF1Oo4dLnrwB9AkjBUHdIXwd8LmJB
	AlME42uKk8KWOZcnn9m5qF25LikoeBl7YbM5+1/DZCX9YjmX/l6j/ucXdg6k0iF9BcoI6KC4M2o
	CudkOy6vIhY5VAHg1pPAb5BK1czp8plh4wMjYgdWQzv1vE/OMJyFCDnYtfSBXD2PVgArYZWcs3N
	bdTqsub9BbjATdEVbhgSINGVI/V4mkhqDRDV2TFPFntuDSwT0YRf0onPnrw0LrGnl+d9RtcA==
X-Received: by 2002:a05:600c:548c:b0:499:5b0f:72b with SMTP id 5b1f17b1804b1-499b835251emr9349565e9.1.1787251878389;
        Thu, 20 Aug 2026 11:51:18 -0700 (PDT)
Received: from OrangePi5-Plus ([2a06:63c4:9102:701:512e:da32:b75b:2535])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b91173c4sm684915e9.2.2026.08.20.11.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:51:17 -0700 (PDT)
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
Date: Thu, 20 Aug 2026 20:50:55 +0200
Message-ID: <20260820185056.20643-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820100715.750660-1-gahing@gahingwoo.com>
References: <CAEWPSH7ETfw2TDjUfOvcVtDm19FC43x2vP=Lh7m+XPOGptnPWA@mail.gmail.com> <20260819105723.632029-1-gahing@gahingwoo.com> <20260819154634.7584-1-royalnet026@gmail.com> <20260819184838.6723-1-royalnet026@gmail.com> <20260820100715.750660-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_115121_114838_3FD28A86 
X-CRM114-Status: GOOD (  15.29  )
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

Thank you for running the sweep, and for the shape of it - one field at
a time with the other four held, three baselines with no drift, and the
honest reading of RESERVED_0's score printing after its timeout. That
table is worth more than the five lines it occupies.

On SIZE_E_1: I would keep it at 0, and I would not shrink the diff.

My reasoning, for what it is worth from someone without the hardware:
your sweep just demonstrated that the traced value is load-bearing in
four of the five fields, failing in three distinct ways. That gives the
trace as a whole its authority. A register built from the trace with one
field swapped to upstream's value is a configuration that no silicon has
ever run end-to-end - not your RK3576 (which ran 0) and not RK3588
(which runs a different register entirely). Keeping 0 keeps the value
honest to its source, and your comment saying it was measured not to
matter on these two shapes preserves exactly what is known and no more.

One question in the same direction: by the SIZE_E semantics you derived
on the 17th (SIZE_E_n + 1 = the number of 16-channel atoms in the last
bank), would different output channel counts exercise different SIZE_E
fields? If so, two shapes cannot rule out a shape that leans on
SIZE_E_1 specifically, which would make 0-as-traced the conservative
choice as well as the honest one.

And thank you for being exact about the tags - 1/13 carrying, 2/13
dropped because it is no longer the patch I tested. That is the right
call, and saying it on the thread when v9 posts is better than either of
the quiet options. The re-run offer for v9 on RK3588 stands; the harness
is set up and travels well.

The trip went fine, thank you - I am answering from the countryside,
with the same board on the desk.

Best regards,
Igor

