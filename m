Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537A1CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VVsKKAAl3jseZ2R6iaLaDzGXnZaTeoKCd2s/NhHV0g=; b=lZt/tJ+juAgW7skTWoGQwzJNoi
	0EoY2C+O8q+yRqP3gZepcfGU6yaoUjhgFeNpyYXd/mdCvu4Va4NpKIbH2aMVbmqZQjagSu1ENHEBE
	2d/zwXU9e7pbH0mV92PhoQJ8N7/DGmkQ2G6lrO5N9tGyLS7sCrfZ93zSGs08iPg6UllvwM9vFkySX
	LA889GwE2QE2kSjVHNCZWHK9R4OU5zbZ/UHOSJN7du+Iaesye0NUig6k06aD3fFiU++RWQZJGM+Z6
	/jqrwD3fwJ/9SwX3BePHNaylxbwtt6gnHTyWSrlGFME80rLRjt+DIYvZzQTilkHeFmAVMnJ4O7Pe9
	3v0Tcc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91sP-00000001l4H-2Ntr;
	Wed, 15 Oct 2025 13:49:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91sM-00000001l2Y-3leQ;
	Wed, 15 Oct 2025 13:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760536145;
	bh=QhDeijH3p8Ah7FVP870DhjFVoOJ+c4VVl9Tj0q4GSts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TdYyJNFFjn/x9drAuSbqyFlDHb1SjL5QCX0mc6UcUjqPYn7wOW3vhLLHtn8yQ4RNH
	 MMOg8r6SuxIgKbaH5aBUipced1gOdbStEPjstByIVrFArcjJRrbfUw0rXm4YrFbkG5
	 5MCKvC6JpWC1cNRT7TTA+fOisATB4PpXXEvrAsK4k/tfQ7zxes0k77u1oz6W8/S0Vd
	 Y/oXm+OkMQAF0KFTDkb6VMQz7FKj/LREI6oE2e5Ufdz8lzppodc5cveU0ai6zmHIok
	 oqtFLmNuKU8yoWU4XDhXdHTj3YKHOR3703XuxVfOK79Q6sGQr+/d5Z+WSjgfxQbHti
	 y8j+QVgnGSv4A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7773E17E0523;
	Wed, 15 Oct 2025 15:49:05 +0200 (CEST)
Message-ID: <e9a265af-b6ad-4f7e-9dfb-bf87f4706d57@collabora.com>
Date: Wed, 15 Oct 2025 15:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
To: Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
 <3f23850e-f01f-4a2e-a7dc-82c04ab5926c@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3f23850e-f01f-4a2e-a7dc-82c04ab5926c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_064911_111489_C410A48C 
X-CRM114-Status: GOOD (  30.18  )
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

Il 15/10/25 15:41, Arnd Bergmann ha scritto:
> On Wed, Oct 15, 2025, at 10:41, AngeloGioacchino Del Regno wrote:
>> After a reply on the mailing lists [1] it emerged that the DT
>> property "firmware-name" should not be relied on because of
>> possible issues with firmware versions.
>> For MediaTek SCP, there has never been any firmware version vs
>> driver version desync issue but, regardless, the firmwares are
>> always using the same name and they're always located in a path
>> with a specific pattern.
>>
>> Instead of unconditionally always relying on the firmware-name
>> devicetree property to get a path to the SCP FW file, drivers
>> should construct a name based on what firmware it knows and
>> what hardware it is running on.
>>
>> In order to do that, add a `scp_get_default_fw_path()` function
>> that constructs the path and filename based on two of the infos
>> that the driver can get:
>>   1. The compatible string with the highest priority (so, the
>>      first one at index 0); and
>>   2. The type of SCP HW - single-core or multi-core.
>>
>> This means that the default firmware path is generated as:
>>   - Single core SCP: mediatek/(soc_model)/scp.img
>>     for example:     mediatek/mt8183/scp.img;
>>
>>   - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
>>     for example:     mediatek/mt8188/scp_c0.img for Core 0, and
>>                      mediatek/mt8188/scp_c1.img for Core 1.
>>
>> Note that the generated firmware path is being used only if the
>> "firmware-name" devicetree property is not present in the SCP
>> node or in the SCP Core node(s).
>>
>> [1 - Reply regarding firmware-name property]
>> Link:
>> https://lore.kernel.org/all/7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com/
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> This looks good to me, thanks for the changes!
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 

Thanks!

>> +
>> +	/* If the compatible string starts with "mediatek,mt" assume that it's ok */
>> +	if (!str_has_prefix(compatible, "mediatek,mt"))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (core_id >= 0)
>> +		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
>> +	else
>> +		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
>> +	if (ret <= 0)
>> +		return ERR_PTR(ret);
>> +
>> +	/* Not using strchr here, as strlen of a const gets optimized by compiler */
>> +	soc = &compatible[strlen("mediatek,")];
>> +
>> +	return devm_kasprintf(dev, GFP_KERNEL, "mediatek/%.*s/%s.img",
>> +			      (int)strlen("mtXXXX"), soc, scp_fw_file);
>> +}
> 
> This might have to eventually support version numbers, in case
> there are ever incompatible ABIs where updating the firmware requires
> a minimum kernel driver version.
> 
> Until there is a firmware file that needs it, this code is
> fine.
> 
> I'm not sure if you need to handle the case where there is
> a "firmware-name" property in DT, but the filesystem only
> contains the generated filenames, or when the generated
> firmware name refers to a newer version. It may be best to
> try both the generated names and the name from the dts
> file.

No, not really.

All of the platforms using firmware-name for the SCP are following the same
pattern as path... so this code autogenerates the path based on what it is
set already in DT as firmware-name where present.

The only exception is MT8188, where the firmware was named scp.img regardless
of the fact that it is dual-core and supports dual-firmware... that will need
a rename in linux-firmware. It's necessary evil, but caught just in time ;-)

P.S.: There is no MT8188 DT declaring firmware-name, so the firmware can
really just carelessly be renamed; doing so, no breakage/regression will
happen, and we again don't need to check for existance of both.


Cheers!
Angelo

