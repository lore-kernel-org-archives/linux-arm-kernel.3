Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AA3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMoogVRYIwk8Wptzr/Oo7EUpCyIlUtkJVK+72BZkIEk=; b=utiua3si+EAeziaUFCfiVq8IPy
	bGHb8iJK3fzw2ONHAQzyQ70HPLteduCNoU4l+vI67XmxvEvEm1PILyYVGkEL6gg5ZHgOfNLA8mz3M
	sbEpyAHVxrJ1nPFdvG1HnZE1p3MB2xPh3esxo+K+pwz/uE+Bc2dM9kCOzxxZ8Gr418HMogI1y0PkN
	CjU3E9HnFcjM+FU+HkPRE+8SK11RnkzC71YTenmNZH0tD3NK4jC7HXPLtptY1ePZMbHf/yOpBxury
	KNXHfyoWd6uDsTt+DUPvyJLD3QkLpD5Yw6Q/mnfnSpJm6R/AUcN44/rfLip1L2eIPM+K3GrFbQW7c
	Y4WGOO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxig1-0000000ESKJ-2OIs;
	Sat, 22 Aug 2026 10:10:13 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxifx-0000000ESJo-1DtP;
	Sat, 22 Aug 2026 10:10:11 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id E73B21380161;
	Sat, 22 Aug 2026 06:10:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 22 Aug 2026 06:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787393405; x=
	1787397005; bh=YMoogVRYIwk8Wptzr/Oo7EUpCyIlUtkJVK+72BZkIEk=; b=i
	p7TpOJ9TyXg8JbynvoR5GTVIYShXzyttF7tdrWMJCmhbG3pMIjYpYlnTtkv2Udsa
	hr1fJABNDI9TWYKdDeqUN26znpzqP+aMgiX9SoBIaQ77wphDts1KyGh0KB3PtFxi
	ESEYrqr8TDrSGZgFYaGukmg46blFshcTaIbBbKljyJ/XLagm4nlM1RPmxEaHhI8a
	1A71VzS9LLDYnS2PAkSqlC0gsFAvimjHeUY4711AxPap8jiF/1tkwTPY+uNoijbY
	MroiuXfIOARxLxRw0UaOaYQ8e2By0gW4bTdnlf/RvFltfanNgjg1jRiK5iuHLGLO
	TTocKuIcbi6jCiDubheaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787393405; x=1787397005; bh=Y
	MoogVRYIwk8Wptzr/Oo7EUpCyIlUtkJVK+72BZkIEk=; b=X/Mbk6VE+ENJTaU+z
	5IQirWGDXrtUCv97wArsTuljfZeOMQm49NbM9dw6AXptiIoouPk5WrVqBylNRTq1
	7qrHp2LECfcGafGSbHsGtZ/hac1lCMxy5aepIkpQnnqH1pprvjen5+RK5Y7SHldU
	uGXJPx+VVYXQ1/veGgKssvc3percQZwbLuNwvtrLVbY8kOx6sknIoO5JNK5vsPU9
	nzQt/cbjEF3B/ZE1C+9A851XOdDgvchQjz8wxTgYW5z1zKb75Au6VbHS8Zu/dpk2
	WfM+7Wo6TQch5WNOTDsYpzy7WZG9+Bb9xduFQYzeLP6dOMaU+zNaPzZ+N90EZwS8
	OKbiA==
X-ME-Sender: <xms:fHWJapdgHgrS_SnP1MLC-YitW2OuDFp0xXgWJ9iDVo9dm_TctDFp2w>
    <xme:fHWJavbaXFnTvZ6cr344qVzBkOUd_LAZXsDQ7iAENxC4VWYboUnVN-TZ5ByHMSMzk
    e0UzoaAEX6Vgo0BxIBd7jB8TdLN23M_4ZKbD9SOeCnntIAUnswT-cgF>
X-ME-Received: <xmr:fHWJauEAhTF_fDE8yPBVewTUp6HC3rZP4SIvUNtSpgX1BAV8zs6_fKySFPPX1zbOCsrvk0Yn1A>
X-ME-Proxy-Cause: dmFkZTGBWdQTFj4HdlU6ENZ1CLSznPDgvJlHM1i8OZX2pVdBj6E3SlQbz5ofJjhRLtzwdL
    odMhyxzcECGNY8afaO8wGltEZEln4E3CTNc0ty1akhBimzcxuGJLqd2VUDO30PNO0dZ6rt
    HXiHeO0r/GLHUCDWxRvnwzLqo1AP/zDqjGHTbd9hktWngEeIEmZvz/5PX7WN7391i+3QSh
    GgJrjllKXTBmxQ45km0dDLQKO195mMeIkX/Qm/H1wJJBTcttcXfVyYRzCZzbyxM0Ob2VJ3
    wLvOtl3Pkn8vfACC/f5w8rs51cB3r0D+zlKMjzopcXHbEtUSeSr2C/ILjtVBnaK7pIF5ZL
    +gtXVvELHMhYaQs/Psdfg8IOl/efEp8vS6Rc8rb3w/rttdCmMBIGhLaHyhsq54yXL/2Uif
    0+N/FUvNWXE37Wu+UCfGghoRDKCNGNq4DZb6cWnXiyD3KItZvzVUQXLtngTyxhLqr8rs63
    BC0h73a3JbhWInbNsAgFoiCwNincOnFjTwQE3TS54nC76ucshwByBGaMfiNDVAWVWIJBAa
    QEzSqEwlMAeLIqKfZgAxLHrxMlOw0WWkZUShFOPduv1jZPwFxr0bz11aSfyneCxzLA4UbI
    DKKqIKKIJZwb1RjIdwtsDVyXfbG7RElDJ1a1G+0MlqQjW1ICRNXdM9us31tg
X-ME-Proxy: <xmx:fHWJatkLUOTDahuC06Roe7CPeyqAIBzXW7vd_FIaIsbC2akI79Iy2g>
    <xmx:fHWJahdFFDK6QgbmR-Pv9BAxuS4zpSKBwvrrdPbHlzO_qo-ucOlkGQ>
    <xmx:fHWJarHnzCIjnoYgYgnljNR5FdCJecRt32EvJjoSM0tr7lMSQN-_Ng>
    <xmx:fHWJanjHXs55tp5LbyFs9PE2_XesfskU6ZIf-tGQovlIm8fcK7YtCQ>
    <xmx:fXWJamPYaeKTZxFiNwYwF_4xaG-9iyx4xh1IlcdhAFvYcz5anq3fdmcl>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Aug 2026 06:10:00 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: royalnet026@gmail.com
Cc: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	chaoyi.chen@rock-chips.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Sat, 22 Aug 2026 22:09:56 +1200
Message-ID: <20260822100956.636407-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820185056.20643-1-royalnet026@gmail.com>
References: <20260820185056.20643-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_031009_807266_37B00825 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Igor,

SIZE_E_1 stays at 0 and the diff stays as it is. Your reason is better than the
one I would have given: a register built from the trace with one field swapped
to upstream's value is a configuration nothing has ever run.

I crossed SIZE_E_1 with the channel count, seven values, with the control beside
each one in the same boot:

    N                      16   24   32   40   48   56   64
    SIZE_E_1 = 1  written  16   24   32   40   48   56   64
                  correct  16   24   32   40   48   56   64
    SIZE_E_1 = 0  written   8   24   32   40   48   56   64
                  correct   8   24   32   40   48   56   64

Six of the seven are identical. At N = 16 they are not: upstream's 0 asks for
sixteen channels and delivers eight, in both the words written and the count
that comes out correct.

So your conservative choice is right, and one shape in seven is what two shapes
could never have found.

Two corrections I owe you. The first version of this reply said I had not run
the cross sweep, and I had; the round is named after you. And I nearly handed
you an old floor(n/16)*16 shortfall as a possible SIZE_E_1 effect, but the
traced value writes all 24 at N = 24 in this round too, so that one belongs to
the channel count register and not to this field.

Separately, on the int4 path at 64 output channels, SIZE_E_2 moves the words the
block writes but not the channels it computes:

    SIZE_E_2       1    2    3
    words written  32   36   40

and the correct count stayed at 32 in all three. Additive in fours, not in
sixteens, which does not sit well with the semantics I sent you on the 17th. It
is a different register value on a different precision, so it does not refute
the reading for the path it was read from, and I am not going to pretend it
supports it either.

The re-run offer is noted and I will take it when v9 goes. Glad the trip was
fine, and I hope the countryside is treating the board well.

Regards,
Jiaxing

