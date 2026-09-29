Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DA4CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=; b=gjWvl0xkjXmjSkMzsur+2piqnf
	Nc4VGLlWAml56ywp+31900tjviCYE9dIp2l6vnjuOK6OySPIokxYnTJBaygxsLHahZP01ybV7Snra
	6Yyvzk9pdUSKjgGr9EHs26aW3SwCcmVgI1bEmh5slKT+WgKlsdAG9FqVu3/7yrWek2Z8rDjNwrUWU
	r2/PzzngnG5vZCKK0feGRHrAqn/95t1Ue4l+g5c/xVoCEHwJPXJceK7ef0JxnhjtZUk4mRZ37nhUe
	walmIAo2v/DawXJilwhRRGnP8RHxCIDaPMWW15Bvssf2nc3s3I0lhaBcpCQuaAx/ixc6LkcnqKH7l
	P2LrZHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbH6-000000048BL-3c10;
	Tue, 29 Sep 2026 17:05:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbH4-000000048A7-3OSj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 17:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=; b=oMjT6yDOk4xZ7SPyPhObVkyi++
	hjFDkMWV19z5NvR2Zqz5E7qF4oozv/L8Ob53QRiJnHB8/QMMJ0u/wgkJYqeB5ObP2IVnLGXyVqBel
	VxQHmGgq2PpLPBcNOjZ+hnpe3FzHkAvy1OUcXJCZWiSwFQqGFopPnnV88QaqjMoI3r5T3NTc2dXek
	xmtgzh74ONuKtwoNX21TA7oNKiw6mzJX6HAeVfiYDxyqEJPDksaKV2GKrd1pdoL4ToauNCdcCMno0
	dP9VmtzcCU9xQcXAZEQ0tZtclW14XaGP+eY9tk3sNSkY+I9S02Il0E5EhNEi+soSWsAllPffo49Ln
	oh3dRCNg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBbH1-00000002swK-387W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790701544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
	b=XaDcXEV9yLuk02aKgzOG1eNJpvvZobIpGZheL1BsDiLz4mnwCFAGuRW0zLoSe8em7RmfDT
	7t20nW8ja8kCc9gNG+QiXm0Cko1uu65PoRjaLQe+Qxy9mfae1OeS34/b6RhGbI/++kUOBi
	DCtodbkI9qx+82GwYZrgzkcg62aUME4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790701544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
	b=XaDcXEV9yLuk02aKgzOG1eNJpvvZobIpGZheL1BsDiLz4mnwCFAGuRW0zLoSe8em7RmfDT
	7t20nW8ja8kCc9gNG+QiXm0Cko1uu65PoRjaLQe+Qxy9mfae1OeS34/b6RhGbI/++kUOBi
	DCtodbkI9qx+82GwYZrgzkcg62aUME4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790701544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
	b=XaDcXEV9yLuk02aKgzOG1eNJpvvZobIpGZheL1BsDiLz4mnwCFAGuRW0zLoSe8em7RmfDT
	7t20nW8ja8kCc9gNG+QiXm0Cko1uu65PoRjaLQe+Qxy9mfae1OeS34/b6RhGbI/++kUOBi
	DCtodbkI9qx+82GwYZrgzkcg62aUME4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-OkgDNyDDMeGP9KDuxJwU4g-1; Tue, 29 Sep 2026 13:05:40 -0400
X-MC-Unique: OkgDNyDDMeGP9KDuxJwU4g-1
X-Mimecast-MFC-AGG-ID: OkgDNyDDMeGP9KDuxJwU4g_1790701540
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so198528785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701540; x=1791306340;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
        b=xBIQohpqT2004fNQx7SA5cVVNyqiDlfANqJxhNdAFebTabyzSvTmyqLF1YVgS07Fua
         /EbQuzhGnb/j4XHb+gxw1taFrK+4KmLu6oY2T0/dxeqJ0RtDcjBIXv8WPptj/vqwwjDd
         WLxs1gEpkjJanc/kpZIaFjM8XKUkBaacvJ5dvgY42iVehnS3AcBZNgf7cudx3o8Y/XvS
         JiZzlneT9pY96sXuJL+lay01CJOKj5wrj0+ZvJyKduUdIBi7/cBhGxQppPYo5CgnwgW2
         bk4euZarZ0GjFfrNbkDn9lE9xTNq0Lu6FtbQfzFxN4wC2rrdBocVDv0bPYzfoBJqh1RV
         NEyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp1x36MDEayZ1YF6RX86mrsElf47v5bDxIDEbtlA3xGGmJ3bNd0YArNsDHBq6FnvUvejwjNYS+JMScyrnO1r74@lists.infradead.org
X-Gm-Message-State: AFuF++lueH8yhtNhV0PZtLnkAHhEG6sDyGA292Rk4FcaWB5YejoJcf10
	T57C3TlbL3puxU7oxBByOepTyCf7R91D/FZpIE4C2lISc5O9FgGs1m7zLuWw1yJiUGKHcelubiB
	d8ms8z/W2ZqBm99qUEgvb7RBKqsqvFKX+34AlEPYnIkNw6X/Az/49ZvLsSSkWgYLt2JRlbUXg3S
	QMgSIBISrC
X-Gm-Gg: AYBFou1qZWYtnMnTHOGvupgOvtNFB2/Dy23JdfwedluaoBayulCqRWsqgRILVJ/iArM
	BtBQAhn0edfiv9klnahdATFWhO0h6v2SSnmPfQSrG58g+N2PVmtRcmlZ8lJ2bGdi71cMDIlNqp3
	/i/v4NMMhtP1IZVoVPA9u8pCtrV8ou0BN+K+7ynLwa3b/AYwpYJmdh/5OLwbvBpHdNv+rBE7OXy
	ivP931AQqsyME2QeKrVIuOobYt73vA8UQ9UFD0/nT27AqZA77zaZG6TZlkrq5v30DOTtCtPHkw9
	43ETlnrklcJRFv4EscO2EBsUIWuQ2HHTYUaKq7Qt6OJ65aZVbU1aQBOaWdTIrX+GbUSme8X0Pjz
	mEQAQsQt6HMV5scIwfIDR9hcQ+ro+R69//A1oPRpeyXY26S51ebo=
X-Received: by 2002:a05:620a:6988:b0:939:7e23:b2f2 with SMTP id af79cd13be357-93c9fa5fc59mr25257085a.25.1790701540249;
        Tue, 29 Sep 2026 10:05:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6988:b0:939:7e23:b2f2 with SMTP id af79cd13be357-93c9fa5fc59mr25248485a.25.1790701539617;
        Tue, 29 Sep 2026 10:05:39 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f541cfasm14451085a.38.2026.09.29.10.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:05:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260719214349.734351-1-rosenp@gmail.com>
References: <20260719214349.734351-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
Message-Id: <179070151857.199845.8103237122518687447.b4-ty@b4>
Date: Tue, 29 Sep 2026 13:05:18 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=273; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oS1ZL6IKxW4hwmHG7GbpdJ7kavjzT5ERg1L4wiG0veU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v39wNLTMfKFGZMxiweX9O+933NBfv1/6+p+T/DNtz
 EW3HmRw6ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAi220YGQ4tX3Py89/Ee1N+
 vs88PJ9ZKPPO+wfFNtIVaaacdV5vVpczMqw+96OJZcb/Txn7FTd4np/zIujURX8e388xaxe3XFl
 2fgY7AA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BeZBTV3Z73ZA8ynqcN84YBaQ-yCuOkUZRyBDktxaEnQ_1790701540
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_180547_981227_C3CB20F0 
X-CRM114-Status: UNSURE (   8.50  )
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


On Sun, 19 Jul 2026 14:43:49 -0700, Rosen Penev wrote:
> clk: mmp: allow COMPILE_TEST builds

Applied, thanks!

[1/1] clk: mmp: allow COMPILE_TEST builds
      commit: d0b72c88671b3c46342bbebc9b90280890436c98

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


