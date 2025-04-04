Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639F8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 20:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/FBk6NdvKrMWCu3tKHxufhADR2ZSaIO/oZLOZ9EnxBc=; b=dgdTDVUv2FRHsvhfykz/xJo1qA
	1fDeJJET26q+ynkUZUUTGvtG6ibZjSG4cihcr8AFMgW0WJziU0y9Pw+iRoWwkMWgAcLreJ5dHLy6O
	v/KGVT8ZMxVXOpcprSN+SiCCOU+P/KV/ibIqGDL9TnK87iOq2azCX5ApDvWR9rBLbIqJxKwlLebvx
	PQv+YQnR8Oz8M/gcLHul3xkV2WvBIXUUma4TEG0yv/ulLuuEnbgGowhCqextpT6cfDIIs3rhBnXhE
	CnYqcqHDsqIuU4HJiNfZXZVwbJCc63vaEMQgU2pagjGclUEBwynqUQdJ7+QClKf8W+Fy0SsGN7dxS
	yXL0oPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nT7-0000000Clnt-0cue;
	Fri, 04 Apr 2025 20:16:49 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nRJ-0000000Clby-1qcf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 20:14:59 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-225df540edcso39519245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 13:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743797696; x=1744402496; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/FBk6NdvKrMWCu3tKHxufhADR2ZSaIO/oZLOZ9EnxBc=;
        b=wWvA5+FQDYRwuM62ttAJNiDiVCAdeBFB2WQlQwJNYaC+brKpfoWEIIYWZDEjLtnMmp
         Z5Z1GXHK/z9Oo4NWC3YK2nUG09qeHIwLtaf8avIwcepjAkz4tXveuCarHnFimogBUedR
         oP5CO6Xz5ZwYYqjzTthJdpEq2jiFQaO1LAGuWxF2c/4IBOF175CJqIVtvGEYIeaRCLYe
         5db590RRQmsOwnN3iEG5shfR3nmsUSFL0dzaIpFt35c7V9HN3QarE3DkAB5qZRwyproe
         8TplNc8L4TgPSvMEhewjc84tDRnx7He4cVpeArjTKTA/HMxt4DCNHb19/3fCijsSLrPc
         Isbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743797696; x=1744402496;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/FBk6NdvKrMWCu3tKHxufhADR2ZSaIO/oZLOZ9EnxBc=;
        b=l4uPMsbBNvk5bVRqlq61AOdYu2l0Uz8H/biqiVROnATDFlHNYi6SI7Fi3dGJC6a9VA
         T7thnx+Q8uF9LajH2qZ2gl4gFqzqRuP6uiUMrYLSN1gG9WeEBQOyzP9+9SBpX3wuaMgK
         Ks00VOvVgyTVyxuyZjhJMTfiQa6OpcCliCjI9ucnOktzTwnPKn9t41G4iBVuKlJifhAn
         aMV0c+60+i6aziVIIK6AJnBDkUQuc3kY3AQlOS62tMK7HSQy0ZtLuT02Lni4O0aqEyLr
         8qdj2TI9zGW8Zvv6ggaZYCtW0XVYYFVeWwOAs9z1xIInwWPVUEBv0M0D9cRjUbPf/BEI
         ox2w==
X-Gm-Message-State: AOJu0Yx7KH/mV8xAyW+VBzKaMISYXXY6Itw6H5o+ti5RmoLYLbQKuZc9
	7KV6xp9RIsSmAp6lfJSUOdRuzkzTrjynjzmTvn5depDSdXZ0+g4MQPzIOa6QFgU=
X-Gm-Gg: ASbGncs47hYnUjtJ9VKo6Kq6yeprBEufRzMmzyv09rUk5VYZcweoyc+zieVRrk2LB7Z
	MT67NKa4D3ttAQFL3eoVGS7+GmT+P1Ax1Uaf4o3bZnlLso148WHxwRRTG3PUHepzCn4XpS3Rx+6
	Frb+hDgsIJi482vyO0o6pLUooZ9Q5wVL+oYaZKHYPygAy0UhSWs3hBiafHTwy9gV/J6QRPeR12t
	DU/FwKSH9dFHVAS4QNB/Foy7NNcBm62fqSA43kpn9MiUped4+pyirG/nsN2FLzhWD8sZLkbpTEN
	cthPK2s7nBwxeXUCFcqPFUgJBiugRMR8PvFKdFHVK2VwhWKJ8+RkGg==
X-Google-Smtp-Source: AGHT+IFpY9obGLrPSf90qFUUIy/i88BUoaxsGk56sC6A1IFiBRGRyXqtZEhSta9iE3ZF6j26evkz0g==
X-Received: by 2002:a17:903:3c6c:b0:220:fe36:650c with SMTP id d9443c01a7336-22a89bac53emr69618525ad.23.1743797696161;
        Fri, 04 Apr 2025 13:14:56 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e61dsm36705135ad.190.2025.04.04.13.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 13:14:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-embedded@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [ANNOUNCE] Embedded Recipes conference: May 14-16, Nice, France
Date: Fri, 04 Apr 2025 13:14:55 -0700
Message-ID: <7hbjtblm4g.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_131457_681095_152A8C06 
X-CRM114-Status: UNSURE (   7.07  )
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

Hello,

Join us May 14-16 in Nice, France for a small conference focused on
embedded Linux (and more!): 

  https://embedded-recipes.org/2025/

Embedded Recipes (ER) is a small, open source conference (~150 people),
with 2 days of technical talks[1] in a single track, followed by an
optional day of technical workshops/hacking days etc.[2]

Also, that same week other events such as the media summit[3] and the
GStreamer hackfset[4] will also be held nearby in Nice.

So if you're in Europe (or want to be) in May, join other embedded
developers in the sun of the French Riviera for a great technical
conference.

See you in Nice!

Kevin

[1] https://embedded-recipes.org/2025/speakers/
[2] https://embedded-recipes.org/2025/workshops/
[3] https://lore.kernel.org/linux-media/18ac3f06-58c2-4121-86a5-f8a2b5d1e47c@xs4all.nl/T/#m0ec5a88d4b24dc3bd3db6e0c6309031de1afc216
[4] https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366/

