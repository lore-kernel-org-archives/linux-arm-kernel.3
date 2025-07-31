Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92FCC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DbdOR03CG+fHJqy+ql3n316LM1XPqyNW+BPxIMwfGU=; b=Y7O7OEiwcwLgISK4DSleYWj5ud
	ZdGu0qfpWR1huAU2PvMgWpzxpK06WilReyub6tT1/NH1LLABN9viWpLjUYO6JAbGQx90OhrHgpwAP
	ZISKAJhZbs4PbfAbLAJPcWZi2rLWHbPyByhyF5rJ0OOHY9lFab2/fTnX5++sH7fuhMLMkhTSnPov+
	3xevZm/5L4E6xZVogGJX2Fc5Bb3NM/gpfcnEtnNgfS3JHVuzInZK5mytTqbBzoxQIYSeS0OhMbd8D
	jY6i7NE34YUM4uas63dRxBqChalzCtIC0kEVKaKzHuD4+Xx1CJPG14tevKLqqXyOEvc0uNi+dRumB
	1+hB3CQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVOw-00000003zEG-2Y0K;
	Thu, 31 Jul 2025 15:41:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVKE-00000003yvh-2AqE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 15:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753976169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/DbdOR03CG+fHJqy+ql3n316LM1XPqyNW+BPxIMwfGU=;
	b=QZLU6ynjSiouk22599A+vntg+l+UNIKIlx4BqgwgDEynL6Iz8AosG7+Pl0Hb+8KIwgso2V
	F6EtiKR5g/DfKmYAataDHrrwHl8lOBxCanDz9t4ph/00PYJdgs8g3ZcmKOIkwr5hX8Drtz
	OFSzZbpi5FNig3/lIif89BCH9XTSV2M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-zpMfCzMeNIGuzgEL97ql5w-1; Thu,
 31 Jul 2025 11:36:06 -0400
X-MC-Unique: zpMfCzMeNIGuzgEL97ql5w-1
X-Mimecast-MFC-AGG-ID: zpMfCzMeNIGuzgEL97ql5w_1753976163
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E83411800877;
	Thu, 31 Jul 2025 15:36:02 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.224.118])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 64CD03000199;
	Thu, 31 Jul 2025 15:35:58 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: lorenzo@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: Re: [PATCH mt76 2/2] wifi: mt76: mt7996: Set proper link destination address in mt7996_tx()
Date: Thu, 31 Jul 2025 17:35:54 +0200
Message-ID: <20250731153554.379975-1-jtornosm@redhat.com>
In-Reply-To: <20250731-mt7996-mlo-devel-v1-2-7ff4094285d0@kernel.org>
References: <20250731-mt7996-mlo-devel-v1-2-7ff4094285d0@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_083610_623426_61347EC9 
X-CRM114-Status: UNSURE (   5.24  )
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

Tested-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>


