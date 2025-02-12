Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECF9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8awgjnRjIsQYZrQ1w+BZZzdEbNxt1fTjOjgKBl+PTA=; b=H6XmVUzfCYIBDAi3k68I2N2wR5
	V+oHOdhtw8SA/OTFIOx03h+GF9OPnGCQ2alcAJzkxjJB45da/8qdMZ56jjKJFuQwiZfx2xVejPe0b
	wQjzeUamQ6aYNSkjH5DNwiQr9mb5Nu0gsmY4Qgvj1UreF3gMnQA470zbEGrLA3522yWx4/y3yPEPU
	ZstNkgrft5CE6JOQRTqsJnyYMcyaGKwM/N5YFxjIuyuDcYyAJpRj+mjSztf3jTqmdg9jSIYB/vnsd
	Oz435RFm+ekRSFI5U/O4Id91j20yLilUZKfehT8gSMn2KEYomKlloueCu0Mr1upHlCzZe84aw/gbn
	3VLR0ckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDEw-00000007Za9-06BW;
	Wed, 12 Feb 2025 13:57:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiD7d-00000007XwN-2JFC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 13:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=V8awgjnRjIsQYZrQ1w+BZZzdEbNxt1fTjOjgKBl+PTA=; b=dQ61uXg/y0xbYja2bf7zcT/eVR
	zapLmhSRz5uBvVcFNUDd+FGSKT1XYRt65ZGx9yYTNQE2UjzMajSjXy6ntPXGIVQETeEi9r1EGhvGd
	0NxNkxkoZrqwEPu3cQ561OSAW7fs49NlMDif0v764+I2bWTZ++ZKLDxeZbkEiJVk/dMQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tiD7S-00DPPM-4W; Wed, 12 Feb 2025 14:49:38 +0100
Date: Wed, 12 Feb 2025 14:49:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: microchip: sparx5: Fix potential NULL pointer
 dereference in debugfs
Message-ID: <86cd2c99-7006-4ce1-abb1-8fe5e535fedb@lunn.ch>
References: <20250212091846.1166-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212091846.1166-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_054949_584817_7FEF00CB 
X-CRM114-Status: UNSURE (   8.23  )
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

On Wed, Feb 12, 2025 at 05:18:46PM +0800, Wentao Liang wrote:
> In vcap_debugfs_show_rule_keyset(), the function vcap_keyfields()
> returns a NULL pointer upon allocation failure.

/* Return the list of keyfields for the keyset */
const struct vcap_field *vcap_keyfields(struct vcap_control *vctrl,
					enum vcap_type vt,
					enum vcap_keyfield_set keyset)
{
	/* Check that the keyset exists in the vcap keyset list */
	if (keyset >= vctrl->vcaps[vt].keyfield_set_size)
		return NULL;
	return vctrl->vcaps[vt].keyfield_set_map[keyset];
}

I don't see any allocations here which can fail. I do agree it can
return NULL thought. So you code change looks correct, but you commit
message is broken.


    Andrew

---
pw-bot: cr

