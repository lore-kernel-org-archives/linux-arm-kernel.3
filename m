Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48746606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bpfeeaQh;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=J9jpK/gv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1Ceh5hEkP+PMTYLmRWYJaMlOvd65D0wF1ivMzQFkRg0=; b=bpfeeaQhQ+bAi+
	0XH3ADMSRFddUSTqD75pZGrbl9jsunatPrd+9cefhFXrpPnCJqb1kASGX/lTyuxYkOESOHCigpPke
	OAmfVS3E326N0t0vdIWsulUlZ1kB3FFW2oAMCvGB8fzRGmSqP15xUeZU36CVa+6oNNnlDR9gypJf8
	8ppw4ffFKiFxZwMujIve46IckqLAdcbx/Qnc04JjJ8flH+LE6+eWihaKMvPpp5LgxkrAPOpKDqlCM
	y89A6sudEHBnujo6d2l4H6zbncQEXLTjYPbPufAQ9k4dI3Km0Vo1r8CQoV4T53cyws4EpbLa0sJ+C
	OP0C/ndfm1FjOsM4QUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1PZ-00000000eGP-3Y3F;
	Mon, 02 Nov 2026 23:25:57 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1PW-00000000eFT-23wS;
	Mon, 02 Nov 2026 23:25:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793661949; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=c34WK+Bcvi+1zgRon3U6u/pljuPwGd58moArawCsQ88QiD2C2VquEGzh1qxsx/HptkaHA7ipvECcNRskN71ZSmdBC0khE27nuKQ1CtRz/G4ZJdZgiaEHrQ//2HzXO7VhLYCvuhaCgU8ZGpiuZMbQx/5dd5DU07EXh5wdD+oA6Ec=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793661949; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1Ceh5hEkP+PMTYLmRWYJaMlOvd65D0wF1ivMzQFkRg0=; 
	b=ShgTWYJTBmRfsRZeyxBwh9Zk4qdWQ136SRr1kfICqunFTrymf4TxO62bQBrXlIghtYk1y0q5INk4xaji5QhvoAIQ//hjastHMr71Qvr+3ZYAz0w+YkBt+BunYQpoDOpzsegOa0wOdj3sEwH7nkWxgRcHJdCnsLJFHj6o/zkG20U=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=J9jpK/gvraLebJuTbTO/5Nh/gtk2Fb+i6JaAMbdR8vODnsudwXswvuH7kmH29My5UOD1iELILoa1jPevRHVyqZiJp5bi5AaJ3mHsv+Ckv7TNXvsYR7NIj66Sf0xymM5UkaTCF5Vb+//3ZQkjHL2VGrP7twTdurWE2Xy5Ul9yQOc=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=1Ceh5hEkP+PMTYLmRWYJaMlOvd65D0wF1ivMzQFkRg0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793661946198328.4702496578941;
	Tue, 3 Nov 2026 00:25:46 +0100 (CET)
Date: Tue, 03 Nov 2026 01:25:45 +0200
From: Igor Velkov <iav@iav.lv>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] media: rkisp1: Depend on PM
In-Reply-To: <20261102231206.GA3559911@killaraus.ideasonboard.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
 <20261102223316.GB3548113@killaraus.ideasonboard.com>
 <20261103005500.rkisp1-pm-reply-1@iav.lv>
 <20261102231206.GA3559911@killaraus.ideasonboard.com>
Message-ID: <20261103-rkisp1-pm-reply-2@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_152554_820512_7A86B431 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026, Laurent Pinchart wrote:
> What does the driver bind to when running on a system that has PM=n ? On
> which platform can that happen ?

None that I can name: the nodes exist only on Rockchip and i.MX8 boards,
and those select PM. The patch came out of the rkvdec thread, where Nicolas
pointed out that with PM=n the first MMIO access can hang and asked to
check similar drivers [1]; rkisp1 and rga had the same pattern. If that
case is not worth guarding, I'll drop it.

[1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com

