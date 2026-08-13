Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A0CC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1VN5J3PqyqZfjhRbif8FIhRVduCGFV2/xR1rtZPKpg=; b=eLwhp1xg8w8cRKV2ymYqRreqLr
	QBMx+aEEA4lyQR4BmTsmBZzEkau3cZl9C1V6hYBk3vz0YDh96JaaLqnLJ8FTvIOciujsZWUaQE6Nc
	I2jU2QSdY/Du3PQuVMtAv5II3nbKxsQq+SN46BM0/8UOelqFgnj06tQgdhbZ+YDja1EP7pQ/f6RIK
	uwLklZ18yymgbqTJ+7Y0iUZXMRXl/n2iiaSjmarp7snni78iyb6A/fD2R2nMtmffiiY2Z2mX1kl5S
	hXEYl2wspxABIytVJH+hIqUPREqQWUCqkN4OGMH+v0TpoaULt84YEReQ4g+9LWM+gcisbWCXo06s0
	zo4qEJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuX6q-00000000vzP-0XJE;
	Thu, 13 Aug 2026 15:12:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuX6l-00000000vy5-2ZJQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:12:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49557167508so268525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786633958; x=1787238758; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d1VN5J3PqyqZfjhRbif8FIhRVduCGFV2/xR1rtZPKpg=;
        b=cndoClCaflbTp6fdAgqP3+JjunukYsjmQJml/we5Y11ljCiuh0tr/Io0g6SGIv8spS
         7MNUpVwri6HFJcGvAjZEAwcdimHWb6tBte4zd5K3wvZ0OAH3kIz6wWNAc4kE3J3XMld7
         S5Wp8qvdCbaJggCHwJ5Qnoim7P3t+8HdX92U62XXfU0HqvtEYzON/gbZdAKw2dvefpuZ
         PMejDXkUfC9a9rvuYJpxobvsf0kJdkIqvDfNVm4kO8KfUAQxZ/7b2pLYXFfPIX+Zhank
         P8hn4sFK9WfZz2B9aGq+97I0VTj1l+pc1w7I86zCLWKxFOfx+2e5ZUsJnJVvi7LD3yQQ
         cg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633958; x=1787238758;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1VN5J3PqyqZfjhRbif8FIhRVduCGFV2/xR1rtZPKpg=;
        b=NKOuoPPleyyWqpm6tyl8TpHgvMOJ9wwJPbgM4RF4Zyt1+vI7WR9Wr1O+PJeZr+DwUe
         vfi/GexQlq/vxGKAVZPS5mHHP1VS4oef3fgG7j6CjjbIiojiZgUw+FiGZj9sKniG2+fa
         EQvaB7foIGpnzgklRAx9opJBSppxHBhdrWl/HzlbUwJvStvif5oT843reVrJz9WsoM4I
         ntO8qv5cZU/lJevVfC+KU66dM35P0wkTHwnVZyaK28IRErk2yfbcfFx6M94toiJszev9
         HhutCIRbSvPzFRCz5stP+05DdbuJEDXMcxrITbf+pqZvad33KRt7Qdr9Eu2FN+u6luf8
         1VfA==
X-Forwarded-Encrypted: i=1; AHgh+RpaY3wUPJjJs3vz7RU1Ex0nRvU+dt52aVnwsqNmRbEgta53I58acqXbxF6eV3G4NxrxCi2Jdyeo7TNsagAqOjzO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3VQgDZ2kRR1fMutGaiC33d+cFgFqRVqVRBoANdZytlX9gY/m4
	JTsMDXuhFKIG7u99WworOH3ooRYHE3A10EGypnVjMBpHv9fl1HQpPr6GOVn5dcw5hnA=
X-Gm-Gg: AR+sD12Oj/bIjHcic1kQQ4zlQXQYivHKVosCIimviNCSkugB4Nhjb719D07goe5qg82
	7f3FZmewL/0z7UXBo39smC7G4QSeFr58G2ortAfhjZ7WVKhxBMMe7bFHKHinOr1Nf56y8W9UU19
	PXpBsCutqaTNL2ZjWgwkM6XAJ+br1cgdlm9+7ug2nmkuVkmw27mVubLGLzNUtQNs/mBJIlSS5h9
	Hi4abkdEHCchFDMvleJO91nyTFI4nS1pDfkUCdbIvTrjH58j4GHmkDtqVjzvnD4c4o3NePRiPnX
	aPHX95q5VK9/FY6RAlTmvv9GQWUeDfm2CnaHKW5wwQG0YV5Yq+g5Y3YryGboSJPqu1IAUoFA6+8
	a312bvqCmAK7zckfHdX3rBIJ6qORfegs1yV+he0j8fwzTEhB8E5rULkDN8zZkkSHXyTI0u9edbu
	2y9zLIV2RoZEy+gPrJ2KhidDCK2w/VTb1JH871oTx8Ce5jnwg6rXunjwllHWVSSdK+ZGQyyUuGB
	7ICeg==
X-Received: by 2002:a05:600c:c054:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499821fa293mr61233085e9.15.1786633957761;
        Thu, 13 Aug 2026 08:12:37 -0700 (PDT)
Received: from white-mocha.local ([2a01:599:447:e518:cc7c:e59e:1489:db94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49982121649sm66878705e9.1.2026.08.13.08.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:12:37 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 00/15] ARM: dts: aspeed: anacapa: restructure
 devicetree for development-phase
From: Tan Siewert <tan.siewert@9elements.com>
To: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Conor Dooley <conor.dooley@microchip.com>, 
 Carl Lee <carl.lee@amd.com>, Rex Fu <rex.fu.amd@gmail.com>, 
 Andy Chung <Andy.Chung@amd.com>, Peter Shen <peter.shen@amd.com>, 
 Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
Date: Thu, 13 Aug 2026 17:12:23 +0200
Message-Id: <178663394346.25776.3034382955561000147.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786633956; l=966;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=5nv+Mr9p5XaUi062nk/bzZw3jZRcU/o4Y1TWhXSnZQQ=;
 b=ixzRg0WlxQZmgEqHtR0ys1/8RqBVI0WxN6HGIy9/D2QEYFaW0DgxzfXMucvcSaQRuLtVu2tFD
 m+urC0SrqcpAbEpCpR5K/W3yetTllGyFJL3w5MUH2QxUVs6XbsOQVnp
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_081239_673475_AD8C593E 
X-CRM114-Status: GOOD (  12.87  )
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

On 13/08/2026 13:59, Colin Huang wrote:
> This series refactors the Anacapa BMC devicetree layout to better support
> development-phase hardware revisions (EVT1/EVT2/DVT) while keeping a platform
> entrypoint.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
> Changes in v5:
> - Remove redundant vhub pinctrl-names
> - Use default SPI2 memory mapping
> - Fix dt-check-style strict violations
> - Add Acked-by from Conor Dooley
> - Sort compatible strings in alphabetical order
> - More commit message for ARM: dts: aspeed: anacapa: Add EVT1 devicetree and point wrapper to it.
> - Update commit message to describe both LPDB and RPDB GPIO expanders
> - Link to v4: https://lore.kernel.org/r/20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com

Errors that were introduced in previous commits of the same series should be
fixed up instead of adding more patches...

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

