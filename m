Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34828CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3CPsXihGUBBwniCQJtpfCea9ZS+16bumyYVi9msdPY=; b=ngh3KlXLxpJH1mAvTZDSMBH01G
	rejMvcJQcQmDhKJLyyUdXzoGR3pIM0x+BWr5xpXpXYDo6d81UxrzJfS3TRRXumRgOa/0XHd2imqyW
	5rWf66voEzG8HRuicNNN8VZjSyuCFhlj5LpRS2Jj8QZ06hrNkusZ+YgMI0srwB2CLJZFnxO/SUH2l
	Gzp8QfyKBjzu7EmoiinNh82u0h5CzPwbRio2DVG92k9I73Y5OJvIchwCn9pemAO8Ap8P+3RYnxAFq
	O8CtnoEnOUBE7xABw8FSJ8e8mKRu0ZqV0x1Bp590BIt1YnGFv37b4yNhWWXqunjIAWcyAQqsgkgfz
	NZmEe2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ui3-0000000Gj5L-41PM;
	Sun, 28 Sep 2025 16:57:15 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ui0-0000000Gj1q-2Zng
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 16:57:14 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cZVpy4LP0z9sST;
	Sun, 28 Sep 2025 18:56:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759078618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3CPsXihGUBBwniCQJtpfCea9ZS+16bumyYVi9msdPY=;
	b=xHuubiMSI1U7n2AhL8UbwNP5D24fqsTalz73+pLetWsJpayvL0H7U0vNPv/fXMsI76dT9Y
	BA0jodO4DTAljzh5/955NxjTofoDmHZfTNUOzlkDS3J171LiYOLyY2SDUBvNsaq1Zwh5zL
	6JrhLKl4TghKRUMVY2QndMe/TNc8ZCO/SBDtDQGLdUowAIqGUQIJk4QRKEjbHGiHF0Kkkb
	ssTiWE8H09QNuZwWRR85eCbezsFXR7izc2l8Wz8JgyHv/B3EUqnTEKNDmL32N1AHcrAcSI
	mz6nzP+67SteciLT+nVZFgYGAuATIL2UgbA4E/I23JKuFiecI4PRluLDgCXXUw==
Message-ID: <a8d62ed4-38c7-4ff7-a283-3708761d94a7@mailbox.org>
Date: Sun, 28 Sep 2025 18:56:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, peng.fan@nxp.com, robh@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
References: <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
 <aMrDKkIoZvAlBD8d@oss.nxp.com>
 <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
 <aNZaatnVRRkaPrnD@oss.nxp.com>
 <32fffaad-7738-4fa6-80cc-2f8eba7ca099@mailbox.org>
 <aNjwyIgs9fzWiprq@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aNjwyIgs9fzWiprq@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 09c0d8297a0a9a440e3
X-MBO-RS-META: axcuj6fk8qs9i65ufsbua5pb77z3odbx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_095712_789086_09046EC0 
X-CRM114-Status: GOOD (  12.54  )
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

On 9/28/25 10:24 AM, Rain Yang wrote:
> On Fri, Sep 26, 2025 at 03:32:46PM +0200, Marek Vasut wrote:
>> On 9/26/25 11:18 AM, Rain Yang wrote:
>>
>> Hello Jiyu,
>>
>>>>> as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
>>>>> so please drop the reset change.
>>>>> can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
>>>>> as the internal driver use mali label to control the thermal up/low limitation.
>>>>
>>>> I updated all of the AHAB container, imx-oei and imx-sm components, and the
>>>> reset controller is no longer needed indeed.
>>>
>>> thanks, please update the gpu node label if possibly.
>>
>> Which label do you refer to, and which one would you prefer to have there ?
> 
> "mali: gpu@4d900000", not "gpu: gpu@4d900000".
All of imx*.dts* use gpu: or gpu2d:/gpu3d:/vpuvg: for the GPU label.

I see allwinner does use mali: label, but maybe it would be better to 
stay consistent with the i.MX labels ?

Also, variants of gpu: label seems more popular:

linux$ grep -hro '[a-z0-9_]\+: gpu@' arch/ | sort | uniq -c
       3 adreno_gpu: gpu@
       1 bb2d: gpu@
       1 gpu2d: gpu@
       1 gpu3d: gpu@
      80 gpu: gpu@
       4 gpu_2d: gpu@
       1 gpu_3d0: gpu@
       4 gpu_3d: gpu@
       6 gpu_mem: gpu@
       1 gpu_reserved: gpu@
       2 gpu_vg: gpu@
      17 mali: gpu@
       1 v3d: gpu@
       2 zap_shader_region: gpu@

