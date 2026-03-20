Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B56108B8F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3D1quXe5qk7PQDdd6d34BRnWIV3Fq6CvCxgOKw7t4LQ=; b=oUpnF5ksaRKplusXQwHpo6VJNH
	XHvxXETC97wn35kOGnQC6qel0Ph2mO0l8r1RVYDanTx2FsAk68n66VC7yzDl/++wdpkGLiYRDzLlN
	+ujG8KA5DU1L2mnwecA/N/uaAZo690EJuj0jQXbjfVHPatQQBMALm7B0gmMfWHAXh4souYQsaPTQN
	CwxcVNQ6vUqn5gfxFrl3p+Xul6qYOFMXgmelcT7yjOE6T032OzYIwcl7SK7U5EI+qq3q7TyiklHqN
	xVwgAe1royXxBpuZqKfLMjODTA7r4Ed1bfs557zDjiL+Rh7L6XQJ1yu4/b09W3wSrYz1ldxFMZWEs
	Et7yj3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XYu-0000000Cexk-1aAy;
	Fri, 20 Mar 2026 10:58:40 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XYr-0000000Cew4-0mRi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:58:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ad21f437eeso16192355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 03:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774004316; x=1774609116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3D1quXe5qk7PQDdd6d34BRnWIV3Fq6CvCxgOKw7t4LQ=;
        b=V53vYMGioOj0PeQLVov4sUZgEnRMowpa7g+rHpBO+lWMFNWT1q4JaGn//L59q4DzVB
         pDiOpLAp6E4yCq33xdjjpg3yeT993Cle525kojMKjdcL9LytLNjClfElvXsOmI0VkvM+
         ZlNokzpe3a6lLljxpE7y0VJmH6gUsbLp1wnSZT984VplWeXi+kUSop9MoJLcOG3+7NTp
         tCSUpaf/+l9a6jNE8AgaF5Y3KVf9yEkBvRuIJS/nYqIh5i4k7Xk+z4SxWE5Vo5N1RcM4
         4khOPjJ+cdmfk1W3EC3tk2wONt3q5FZ9XOs03UyDmQ6M3DgRgHcbNdfMYA96iagF6wj4
         ToVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774004316; x=1774609116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D1quXe5qk7PQDdd6d34BRnWIV3Fq6CvCxgOKw7t4LQ=;
        b=TcTq15uAFHS0NtkcDCio8kbIjH4JfZDWljlUOyBytoDqrkMwY9SsMGsaEHM7yCdpzZ
         P4uzeY9yP4wTUhI/B7Bsp0pXSh2Y9YXQcpnijYZ9DK8rg154izT7CyuuoZFl/3eGs5WP
         6eLT+468FeLl0FBk0gWaW6NyiFsC2k2DtDm19+I0dxiw+1TM/3op0oKa+VBn7NtrmfVJ
         gftmW6klj9ZqvQ7sEKm5//zeMQHhpVDQ1KpgCzjuCz8RhQ9EvACjA/0Dt+Vn/aBqcfT9
         7tWSpEnJig0GaGQLi45aOsBhoV021KtAPjMDT1WV8Wmr4XmUA29riSQVwkxejLHNFWVE
         1GiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8cjYBq4EYEfHRiHn4qFgkmU+QHN4qpM79srB0Z7LX2DHaI/kwfEFwlW9it5YBcT8HTo1EDp6Dy05rMbdnBJIi@lists.infradead.org
X-Gm-Message-State: AOJu0YzrTjQAwwgZomitFwv5jG/xEvSKd4XyQVBeSJ+9Nn/9cKW4KhTt
	UgsvT4BE4R5rBQmCHi4ZgCFRm5kJ7iampzMO5g9OqDlKJpR72I64lclw
X-Gm-Gg: ATEYQzzP/vCZndPtrFP3AHhccqA2CkuiDWdN9DLsVvc6FY2UyZ3GRlwR9VF+rr4clp3
	D/nghci9mf/yY60y02NqlP6Kw1v9R0Gb9CyshAWZmIrIEeIiBfSoXZnQlUKccS1bq/aAid5g7LT
	3Sg0Uz5cd0cAO4ITvQGoOoN4FlxeaQQ4nWbIrSbEc5U221Ltr7fp3BZOJ6Tt5xY/HSMM18tT2e5
	A2+d0pMS0HuwUEdDrW3MefdGoMrjnINAL5omdwJJ6uRLUTr4UZg1b17KXunrs+bhs061igW03xp
	gh6CsUM1iLomHvTiLQk/nbcRvjyE/tNdp9BS73oJCLzThf7092PJDs+1nQ330cQUhxglW3w8Vf4
	X/2B0nSFRHHkcF9uM48ux5J5yV3fw2o2p0UC5TVRyyGopGRjNw4bhROXVIJFqbrdPQ6wLy91WjL
	AqqvebPV1VT4pA877epH7L0/poWiHaXSPYAEc7lmbw6AFX/rkFSH2K0DRhCU7x95YLgNOhSuVQE
	E6ndfs=
X-Received: by 2002:a17:902:fc43:b0:2ae:5628:a180 with SMTP id d9443c01a7336-2b0772186bamr52147315ad.25.1774004315676;
        Fri, 20 Mar 2026 03:58:35 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516eacsm25636405ad.15.2026.03.20.03.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:58:35 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v3 0/2] Add initial support for Lenovo YOGA Tablet 10 (Wi-Fi)
Date: Fri, 20 Mar 2026 19:58:20 +0900
Message-ID: <20260320105822.447337-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_035837_229377_44A3D2E0 
X-CRM114-Status: GOOD (  10.54  )
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

This series of patches adds basic support to
Lenovo YOGA Tablet 10 (Wi-Fi).

Like v2, schema validation still reports errors in mt6589.dtsi,
but this series does not aim to fix those pre-existing issues.

Changes in v3:
- Add "Acked-by" to dt-binding
- Remove "mt6589-lenovo-blade.dtsi"
- Drop UART node

Akari Tsuyukusa (2):
  dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 10 (Wi-Fi)
  arm: dts: mediatek: mt6589: add basic support for Lenovo B8000-F

 .../devicetree/bindings/arm/mediatek.yaml     |  1 +
 arch/arm/boot/dts/mediatek/Makefile           |  1 +
 .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 40 +++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts

-- 
2.53.0


