Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E304BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Is8XXTNOyILK+r8f7Gs6c1X78jzKDdIzy2diFsj8A8=; b=36QxOejqrAof4Mu5IuHUACmcdt
	1ic8vEnq1he3GxZ7SgQSurmcLEqGs2rEW8eFzqr9vmYCDlDkODpuajLGbB3ZHUSN8B76O8HQQ49Kf
	lyMrWoOrqMrFAz/4FtDnBe1J+UMJlokaPPnRX301ZDpLetJoy1eOMoS5PW+2h1EpPvENBgqGOk59z
	P+W2cXHi1ZMQUEq7i9ph9MkYWaOW0NKaQUT0ao9gb5DT+Jugrne1Qh0Avgev9t83GLGTQHZ3A4oPw
	JHGULz5qmIdljEnTvEuxbNflGqJv9wP/IpU6AL6SaqykTulGDcg2JCDhdSGmJjxipHI2dwSuw+DF3
	Iv07ht/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLW3-0000000EHjH-0Ql1;
	Mon, 28 Jul 2025 10:55:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLEY-0000000EFTF-2BFt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 10:37:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-236470b2dceso36694635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 03:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753699049; x=1754303849; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Is8XXTNOyILK+r8f7Gs6c1X78jzKDdIzy2diFsj8A8=;
        b=KKsM9LnoAu4RwkyRlVc5lvxGfQBqol0PWAiJDDj8APMSUF7F4CHrHZxVg1wLuWbs5e
         QL69KVtiBNY1DU/e2rPMVRuHn5qXqZyDNgxJsKsDTsDVQXiQC+eC3RfxLlQNU48bSnt5
         1Kq6vuXODDO9S94UF8eftd3u0mFPAceWTHm91B7lbaeWZ1Pvnqte+OR1kCo+wk4YCBeP
         rqtr/rm/UZKJpm+A+I4BoWzKqqzIbe13mJZYVAwA6tpVYLkEKYbEteLZA5i0Rtb7qbME
         R5HWj2oDv38NnI7x0jb3AD189bDZQmZfYC6ko8Tdppl5Nnq/WxPfgX09EXf5LG+1r/y/
         nGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753699049; x=1754303849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Is8XXTNOyILK+r8f7Gs6c1X78jzKDdIzy2diFsj8A8=;
        b=DHgoArm+hdLg9QhuIZpR3pZQ/v/6UKhBGYESEkfBtUGR92ukp00KLZJeJ4K14VUQwX
         jLZ1bVP+Z/DEnKBgY0asCdBetS2h6nzNsTagf+rvsSyA7bjmKItc+sgEoqyRZVTH9pqq
         NnoRMQ4m2HX/LjosWurqhrK9f7pUm0DVgsNkpYubbuh354MRBrcWqqBLAgk6e9ZQInKi
         9PEbIPzYkduDSRS2bZNTbfFQJTwFRQ0+2w/LT2aHmI1riq8rVYW9OO/AeS1NWw8FpbjA
         zQ3kAuOnGq0+XnhlHrATIBkfDRTsX93iDOmyW1PQb9+CJc0oZxvQ/0oO8P447Huf/20g
         iQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpX/P707Y5W0Nh7ijhywZVrLCawZG/af3iUudSDQSAkz1Gqz3aMuKBpuqafRQgQ8qNjrMiRLRR9u9UGBV0dkoT@lists.infradead.org
X-Gm-Message-State: AOJu0YzK7ALDLlQqu8iUmBr55otbmveMQXPhpmxyKWCv2o/8ujwaJi9L
	k4OhsFm2KbsR6Bj7Zt1IouI4iWqc1TDnE1u+0arpY6lANScaA62xq4jcub1M7QFmxGwA27nAtP1
	3oAmK1WSPkPDbieeCxLxHD7mE6PkQNu5bWk1Gpl4=
X-Gm-Gg: ASbGncumAlxsYFNK4fUnVyiQJO0nCeXvJy0Eiw9dJZaChSasOPo67B9DZUbj/2nKc/J
	M+dQFyOez66Z5Qxy+44BB58+xfKxsFZ+29m8gVbUXe5z+cRLEGAfoCMl5Oq96GBrEFB1NjRxFM4
	1bHMZYUgXHcMfh+LCarPZS97gXFPpaP++9uMZJj9chhxaD8wWla6cas6Hu4llsbg4U5biDwRsCH
	Tx1
X-Google-Smtp-Source: AGHT+IF4QGVaLVSA5ClJtUhy2ZGKo+uZLc9uhqMBNSoOZOe2mbNHozP/VopVOfBiabKiy2Le+9KmLA59gGymrhaOPLc=
X-Received: by 2002:a17:903:2351:b0:234:f4da:7ecf with SMTP id
 d9443c01a7336-23fb307c7bemr126693305ad.8.1753699049378; Mon, 28 Jul 2025
 03:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250722075225.544319-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250722075225.544319-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 28 Jul 2025 13:39:38 +0300
X-Gm-Features: Ac12FXxqLG3fVa6F9gxX4BalbdOcd_A7WEBuWW7PtouWA-80m-MIDVezM3ly9Hs
Message-ID: <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery and
 coredump process
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_033730_563646_B407285A 
X-CRM114-Status: GOOD (  11.65  )
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

On Tue, Jul 22, 2025 at 11:16=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> When enabled FW recovery, but is broken because software reset is missed
> in this recovery flow. So move software reset from
> imx_dsp_runtime_resume() to .load() and clear memory before loading
> firmware to make recovery work.
>
> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> coredump, otherwise coredump will report error "ELF class is not set".
>
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver fo=
r DSP on i.MX")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Changes looks good to me:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

I've tested it with Zephyr synchronization samples inducing a crash
via debugfs interface. App
can recover correctly.

