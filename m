Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E16DC4453D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 00:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWaMVB217J5XkLdEgIoIU4LaUd29zl7Y/11Q/hCVbKw=; b=cgu9e6b+j3Gfrq8FTAN5s40NIv
	83wWSgD/ibPtyHPEnCmrzCtTFfH3bDa7IbZt7dGy9tppZ06sVv+e0NSICEbIadnVdFaeB+FvxRaEj
	JuQGc7fZtBfXlCrhPFza/Flvp5U9xPqzcAb8u/d9icp+3i9aYUnKrWRrq8se3C6JgZPsARRzMCfwq
	s/lsZWl28hoOQc22Fxg2qQhs5ngPgcJKiEnYXUW+vawBMC5M9rEeqMbaQDdJEG9vfuaHxX56IIznt
	6WoP67Zq6HvJOhYc43cw5t0q1vqWsxtgNw2nl+mBIJPGVsTBMRwdbdy7f0jlx4lkZ/ZbS//31Dlmf
	CiD6QRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmhak-0000000D0ZD-3CT7;
	Thu, 23 Jul 2026 00:47:14 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmhai-0000000D0YP-1cyH;
	Thu, 23 Jul 2026 00:47:13 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 688C6130030A;
	Wed, 22 Jul 2026 20:47:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 22 Jul 2026 20:47:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1784767631; x=1784771231; bh=jWaMVB217J5XkLdEgIoIU4LaUd29zl7Y
	/11Q/hCVbKw=; b=ot7y1o/D+RXb36r9Rv++/f4Ga3sHXWhRCmIotuGKheuwLp2M
	qReB3onN5MaJb7qGpgheAOLvr/WAsd9UurxWze4FR2iiXYSgZQujt8T5OKD0Zmj0
	ooMbWG2HDbpVENF1POXvGQXn9IYvCQ1X2rfnzfkPAV1FcqqLxe9BhQ2+l3SHvPcl
	Hqx4T7Ci8oDGMhszhV119k9r0+2hOVVZh0/IsNeFbqttmpymXjTnIt4LI5qEQ4aQ
	2CqQU4yLQmGcIArhC4g3+FjlCJeMpYbvX9DfpRyKBpH0C1L/1jrUqtWZB73Ts1dT
	TY79CJiGIzTddyyvoCfpfb5TzmKWgbrK6Qa+Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784767631; x=
	1784771231; bh=jWaMVB217J5XkLdEgIoIU4LaUd29zl7Y/11Q/hCVbKw=; b=d
	eHdj7UVn/GR7HRsgzVmO5Zzi1k+NCZIae+M7pvmPcsgU2z5lWEj0kin9tjDiEZ3X
	qilUZtKoPtexK/4Ss8Vw+Y1JpEknxxpiUcYa/PFib8hID2vXn8iEYNooyJJZpsXx
	uknjSf8IYBtK+sKvw3+jYnHo0trPW8e/0ac+HSZjS0NoT/YB86phfgR40qxObMv8
	VlZTEAAK1V225hNguPrdsAtyaThfBsHSzOnNTfd8Hx0/LuwqpVidhZBKF+KY1QVB
	tNPmvZj2tQR3G1Rj9cCsgccXWtqJS1l40vJlYMy0W17dRNpU4kHA2qkFu60ihc71
	3y6ZbUi/tXuTujqh+tOfA==
X-ME-Sender: <xms:jmRharGreDltf4ySxnmoGx0o7IxMp_Pj6YcApo-BVtFQJbgsvt27lw>
    <xme:jmRhanxENcOdtvGDMnWT4u51XzM0HueXro5Idgpa4wlcZj6vZhHooK83wPgJrfEV5
    --Ha1aLEBlErP7_2zRFdb_BnhFzu3aKBrYuMOmPuExOjyXCAPSDFQ>
X-ME-Received: <xmr:jmRhauOVsDc6A3KYpbqU9Sz5bPGbvdrxShT-K55ffaywpA3Gr2bZFeBFRcKaAHDtzKTvTzrOGi9JoRVXukXyiEPhAHX48CPZ9E3HjCabvUNn>
X-ME-Proxy-Cause: dmFkZTGT6pDE7ROr/Hozct7PtmKb1bP65C0DyW42xkiGcmM5l/vHrs8c3kaqSSXYBT1BMw
    +Y4JWWHcwHwE/gXFX+GJTs88UN1YpGvrwXyFKNWZMRhUfiQA+Ug/Cav2dB1SgUYDMC2qEh
    8shynik/cfqaXTdqMsuqB2CcsGWg9s26iWrxKQZDi+fuzL33he4wZ4J8D+t7na5WLkqjNr
    mnQq25aDF1mexaAk+z3OsDBu8G59fSjlk6/AgneWO9Sbz+Acf9zeDwWga7Ecwo2Y6JQzrM
    GNWdJKHL0nLwPAixd9uDz7a6pXlSCuuB7+5t8moaXxbEMNnF7NEkejALwTyaVs44sI2EI0
    jckNz6oB9oAVtgT+v1jFEJAbkvlqpuDaXwwlIZxS6oUU04/u3LEg7oOoQnSkjtf5GzMbrh
    hRpYt6qmWTsFCx1TKE+aKs6yiX21uJtEw0lH0OqDhjLDGhVrZwgubZ2OnXLDEtdRwvTTF3
    HDlyklmNvM3OTegF9szpMXLOJpTgTpFd1DbXruDO+wrJmZXBpHAGjNOLW0g5j+KaWj4V4l
    6YQN1BTNMGXUz5N7wlIIIG6olFv4jHckmnEOGJ5BJl2FJ/hkmpnBgnLAkeewTkJIxIUG7i
    RpDaDVgs9upxMvhxnVzZveeK6gjy7rbNQn7zusgba4+Iir6Ohg5lizrYr/kA
X-ME-Proxy: <xmx:jmRhatY2yJczDob8igYb7TIz3YmghpeKlhvdYBeZoZvLzublgIg1EQ>
    <xmx:j2RhalANrwOkV894SLBbQ8VHqoN1uxOfMFbc-_xk_0RqLDykHjKHyg>
    <xmx:j2RharFa0NNZIbJkN7Za0_4xwraybIfXlpzr8axafra_5QtUYt2oEQ>
    <xmx:j2RhagOuCJW9Oj9I1VPRlo4CN7RyzFFZwxxOogmOQTCc_W1s8a6hyA>
    <xmx:j2RhauHBJWdSk1q4lvxDQ6zm8HC_JuVT3HGD3pN2SW4yltFU3pKaEUTO>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 20:47:05 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de
Cc: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.dufresne@collabora.com,
	detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [RFC PATCH 2/3] media: rockchip: add VEPU510 H.264 encoder driver for RK3576
Date: Thu, 23 Jul 2026 12:47:02 +1200
Message-ID: <20260723004702.2075313-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3096814.BaHzMo0RvP@diego>
References: <20260722073417.2064667-1-gahing@gahingwoo.com> <20260722073417.2064667-3-gahing@gahingwoo.com> <3096814.BaHzMo0RvP@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_174712_484079_1B85E927 
X-CRM114-Status: GOOD (  10.07  )
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

On Wed, 22 Jul 2026 12:00:27 +0200, Heiko Stübner wrote:
> At least the comment and from a casual look also the code get this
> backwards. The idea is to explicitly _not_ expose multiple video
> devices.
> [...]
> Any (future) scheduling should happen inside the driver, and not get
> offloaded onto _every_ userspace application individually.

You're right, thanks. Exposing rkvenc0/rkvenc1 as two nodes and pushing
the core choice onto userspace is backwards; rkvdec_disable_multicore()
is the pattern to follow -- probe only the first core, keep any
multi-core scheduling inside the driver. I'll fix that.

Depending on where the interface discussion in the 0/3 thread lands
(Nicolas is pointing at a lower-level stateless / Vulkan-Video direction
that Detlev is already building for RK3588) this driver's shape may
change quite a bit, but the "don't offload core selection to userspace"
point holds either way.

Thanks,
Jiaxing

