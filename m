Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9ECC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAN0remZKwTzPxuAENpiQH5fEVpl+tgiLHbVt5de6NI=; b=oXmU/fE9xnQfNWsyam6FXDGsMs
	vQ+6VQ4heQmpcJ6hwrQU9XJulqftEgTh4OIfq4jtqbdmTVnPRcawxzVwfwGHDoNYcAuRiHrnJ1e5D
	isdzmKf5wnvggyLb3tFrvIKV4BdBD2u+BC4JLG+bZ5pNpigoi1ZTh2qYw2EoqhtdOnW49jE9XqND+
	EpHJzSzUjJFkYyI7zXDsck/x4GFzWb7746WnEAOpjCfbn2W5xx3bgMll+n7HE48tr/GnWuVFLVh6L
	7+OfmjRcyIyTTxDCEglq/xYgujN4hInysnENeWT6fjUPJjN01c9zlOz+TsYiF2XDu3JZfwU5WBhui
	lXerzoIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqXX-00000000o7v-01qn;
	Tue, 25 Aug 2026 12:46:07 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqXU-00000000o6R-18Pe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:46:05 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c082647cd0dso41983566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 05:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787661962; x=1788266762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAN0remZKwTzPxuAENpiQH5fEVpl+tgiLHbVt5de6NI=;
        b=ZKRXPn19fZUZ1sN2PfBYTkBpZU/iPyWUAbCSzWBW4JT5vL2SE4cS7T/AFVsO2h3CgN
         WSRgX2rkF5ARtAXpphy8rvvzIvX/iXjHEJDcYsPXZKtsN3PAcGTqNIx1fS2BXQdivGYr
         ZGaCJdBzEDjytVM1TQ0AnH6LgR6BU9rQgs+n8i2GP8ANeZb+1jz28KOfze2Wo9KbuCnv
         OC8VChg0Wh4YExasRdWE26ntBNM/XBha1HfL/RyYxAdfE2AKHXUb+nFrWjZWibuz67+v
         Wt8py+69N3W0P0rA+sVdBnMIgYkJhaSw6mBdcd3xFvprm4RCbQ1FSVN3mh3WGwXMkP93
         1kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661962; x=1788266762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZAN0remZKwTzPxuAENpiQH5fEVpl+tgiLHbVt5de6NI=;
        b=qYmd9l4r9YSZVmb0183xlpj4zU06vutMCA6IVif+O1xcQ4q1KKvbElkUo36ptENWS/
         XRVZemwD4x4XveUeHiC6G5wDBDH73BFyvDNFdPQf7AGyuDDtOWvJYOY/e4cvnKtFuPrT
         5OVczqBoTpFZIzhqZC3rzyEuSthbJHvswjlAnejUpw74FhjO3pBf4vlCQ/0l6/zkR6Fb
         f0FOtTm1y5+i7JFm5ttXkD/HTTzOtMxhkLdAvxSX1YfGizFR+fXk3HisS9gV/Kgz0cYb
         Gg2HjyYT6VJVTaK85n5M1vtpZ4Slig3EdywWD+m8lMOSTQOdqVBWQt19t/EmhDd0zDyS
         CV5g==
X-Forwarded-Encrypted: i=1; AHgh+Rp1YQvSs7miz0lVDf4Zuz18iPhN33aPUkmoCPMxxe+41hSQLasPcW8yIL2ESA1s8Uh8SgEyCd2F88TTPWDfNptX@lists.infradead.org
X-Gm-Message-State: AFuF++lKZGDzTCw5iR6qkwwOz3TSiYmQ/9n8ojURhv6dU43qD6C+N87b
	odxk9Mumit/symwn0DLzgrejjYGoPcQY7eVkW+K2kIc1DaXmvqYOFT7Q
X-Gm-Gg: AR+sD136SqzB/Y4cELt6NybY1hIQr46lBEMr0ZJmV47b1IwMK2wKfsXZg0lSiQEqitg
	UQ3jbNhfffDvChiOxt+cdgx2qz3uSjOJPkDWt3zsu5PIGS+GYtjVIEjpF8kF4XLjc5ZdlcPfhTC
	56Y5M6G8slX5k1/yt9pQytAJTN7UPdp+OXGVKrexeemlpepQiCkcOKS8TsN5mbSq5BKzy8D+p/B
	q40QYL9YJ9kp9y3I9o4rMrl4sLOE5iOAMFp+g4dOnItrPLWGEhoN3W9POVvI3dGQL9pmDVQToDz
	dIW1mkFBrCtH3wAHKYRNZT0zF/gpoqoIuzqhfXJA++jw0F5EVDtTQx2wMKGvqrHSjRsuoJPQ0kd
	WOsC546+phG1FMENCZASDB3vZWrvWYmWq35t0ujuheEldL0ZwJy/Wv136GVo89+5VnoC6nHAcFN
	vHtKD4UPF62TOGtQL0V14qExE9n3fAcNVtIdXNtBTkHOeE6fu+Q5nRtZjKjeBaz/sjHN05zEnVI
	GLHF5RufMmXb/+U03I5SzlDGLJvKOO/2HP4
X-Received: by 2002:a17:907:d0e:b0:c20:c5f4:e19f with SMTP id a640c23a62f3a-c246a65fe29mr2143386466b.4.1787661962050;
        Tue, 25 Aug 2026 05:46:02 -0700 (PDT)
Received: from OrangePi5-Plus (178-223-53-162.dynamic.isp.telekom.rs. [178.223.53.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629929dsm1824340566b.23.2026.08.25.05.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:46:00 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 03/13] accel/rocket: let the core suspend after a reset
Date: Tue, 25 Aug 2026 14:45:42 +0200
Message-ID: <20260825124544.11766-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAEWPSH5MVzoQMaFOEQ93+1pOPmcXCDNfuXsv5j-X8Lb1fy_hrg@mail.gmail.com>
References: <cover.1787568658.git.gahing@gahingwoo.com> <b5265e47492897d0ada844c2ff7f477bb715cd07.1787568944.git.gahing@gahingwoo.com> <CAEWPSH5MVzoQMaFOEQ93+1pOPmcXCDNfuXsv5j-X8Lb1fy_hrg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_054604_325169_B014663B 
X-CRM114-Status: UNSURE (   7.78  )
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

My mail client wrapped the tag comment in the previous mail, which
would truncate the disclosure when the trailer is collected. Here it
is again, on one line:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores, induced reset, JOB_TIMEOUT_MS=2

Sorry for the noise.

Igor

