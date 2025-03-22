Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8D7C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cp1oPo7ryv0hXZ0zKZ+Jf/Cwf+XFt5t/QCZJ7lczYrE=; b=oWLhToWp+nzpB3AfGFah+UJ6iw
	YqlwOuYtTV//jS8ayNOr/9mP3TalGXokBONPAEnf5O2g8TELhfMH/Z8gjOSD8V13gX/vuQvtwc+yu
	j5fG5gIu7eXj4Pra+X+vGkyIv8fbT9cinsCqW8foUGZta4vyXbtqg2plvUIrw0J36Iv/tIglL8FnE
	f79cA0PUBqNadBpZ7zc8Zm+DeuRWPKFbFTtweyOyPIfte7/xMOxpfXtE+8k+K52OTVLHF+J3ASN4u
	BQExPDnb38CFD8I8EcjeFawfWSAn5kI8kVtspFn/BCpdyViYGZLAyyz1JMRLldzDo1RcFtCFmdjax
	69vp2VfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvw0a-0000000HFUM-2pju;
	Sat, 22 Mar 2025 10:23:16 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvvy3-0000000HF8p-1Vxo;
	Sat, 22 Mar 2025 10:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=cp1oPo7ryv0hXZ0zKZ+Jf/Cwf+XFt5t/QCZJ7lczYrE=;
	t=1742638839; x=1743848439; b=INCT2E57uizyg7YdDTq0DAAhk620eo2eyOdODBXT22Wep8Y
	D5wKIvjtzayaAtIQpCdDTzZ6iVap8vu4t1hY0+Qpt2mRFP3Q8B0BZ6sW9ZM5FvwdHmqeac4xySx3M
	jUKkP+Q7VwFJPyoWfsyMQgm25ISCs7gPoqRJSNrblw4HcGTZvGdgIooxSdf+m4CoWGYB+ZZvm/enU
	/yfc8FsUo8IhrJbmR610l0cnJGWSgBr2FM/4xLw7TfetH0HiGWQpAPilXFbJ0ETSMj5JjmRqMjv8G
	qDAinJN0crds24pszEJHVY40aDL6lqMJDhC1YYd8jhO1QqDnYvt/qzXs8BJnZ9EQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tvvxz-00000001vlm-17Bm;
	Sat, 22 Mar 2025 11:20:35 +0100
Message-ID: <631977c57b2236edfefb8db7a28885ff6888c823.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mt76: mt7996: prevent uninit return in
 mt7996_mac_sta_add_links
From: Johannes Berg <johannes@sipsolutions.net>
To: Markus Elfring <Markus.Elfring@web.de>, Qasim Ijaz <qasdev00@gmail.com>,
 	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Angelo Gioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Bo Jiao <bo.jiao@mediatek.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder
 Lee <ryder.lee@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>
Date: Sat, 22 Mar 2025 11:20:34 +0100
In-Reply-To: <061ebbe3-557b-46d7-acb8-308ae87105dd@web.de>
References: <20250320201914.48159-1-qasdev00@gmail.com>
	 <061ebbe3-557b-46d7-acb8-308ae87105dd@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_032039_396745_9B2C8E16 
X-CRM114-Status: UNSURE (   5.96  )
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

On Sat, 2025-03-22 at 11:01 +0100, Markus Elfring wrote:
>=20
> I suggest to avoid such repeated error code assignments.
> Can an additional label be applied instead for this purpose?
>=20

Please stop your "suggestions" on this list. None have really been
helpful.

johannes

