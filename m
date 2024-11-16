Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E53DD68BE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 17:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugg/iLQbVd1pD0SvcWGfHZ1QyN8v0iCQir2+yUEZXS4=; b=sXoeSv94U39mKxcCzOcnDFKU+m
	XW/lJhku0DdsqwR3L+/4/KS7HYKLq1oWEDPZswEiGUYUugE4tB1XgukOigDZjE8BULvEyhqnXIasH
	OWTlglOcjKBPMSNIdLcv8qSZUYccA09fI1VguymWyUlEkR90ONJRmmeU9ahXz6XasCo9R5GJQ5Z1s
	aZ61m5NS1rw17BE/lc/c21u76T4RXjpY/LcYpB/7ywJmwWbPplY61uvRbNQe1DKxMnnbAjlwg9DVk
	8oDCIrwBDoLfF9SyuyZHallf+CBwGmBc1yNKOeZDUeTJXbGnAiaBUW2eTvNnPEU7CADsCnJANSyLe
	WxzMACZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCMoK-00000005yqV-0tbX;
	Sat, 16 Nov 2024 17:42:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCMnO-00000005yl5-1RIL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 17:41:19 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5cfabc686c8so637428a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Nov 2024 09:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731778876; x=1732383676; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ugg/iLQbVd1pD0SvcWGfHZ1QyN8v0iCQir2+yUEZXS4=;
        b=U3eKvaivg7893Ft5gNXuEXKvHfjW8IEdgwpIcqJKDpmlmFm8JRrrHSTGiWfmiYvwJm
         n8GVMWNCq80A8rs4qAPQ/7vOCRnZkfsHngc074ZYJBFaH31AGUZbj/JJVhGA4pOZZvD8
         zftA+UvXInRI3AFe5PCT14c6YVuw4ytEO1LynrIrk+beCbrltZdGCznBC2X1j6ussBgK
         Hzmu2Vmm+yMArTwRHOyyzWgMj+vtWzIIt+f3py+o4q6C3BjnyZZ2lZsJQF5VKDPzw2vh
         EHuNsJHFSmqtBSX8wh7pfSlKF3R3kFkKWa9GcP0rLypbYS7A7p4xS00aEzL+DSOs2Xt3
         kMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731778876; x=1732383676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugg/iLQbVd1pD0SvcWGfHZ1QyN8v0iCQir2+yUEZXS4=;
        b=SXaiN9fbe89V1Htk1GnQdlE8bXL9Ity2Kfr2A3dlGKt/bvPUFNxrDYWp8LXqSppzNb
         ItjJaJFwpCN46wkCQiqQ3ECxl1fYHbSA7yXfsmXV1CjkiXGthMUtFgI2Ueze8aca58qp
         TBk8YeboYRMJXyv81zaEJ4ZMFlsO3vxisWZUW/YLygHrST3x1Ul9xcbSXOoFs32q5BMt
         WTzGWubgSSJ9XRGWrh35/j8smJz7hjc2TXYN37kBF1GQ82kWpD6D/B6sNNmUjN22SYAi
         aWMrgjWHcSR1ZCjhXnalRk5Gs0dsu5P/y3QyV5ZREvevFpXY78SPqWaiHOg6CqynKijI
         oUzA==
X-Forwarded-Encrypted: i=1; AJvYcCUfPf2UoHuurSzA18UvEU0ambMjQA7cD8S69Pwr44nzCGW7P78MyqUe000BBsRvOd8P/EO9PSri1CVFJG6QkTXq@lists.infradead.org
X-Gm-Message-State: AOJu0YyGVZs9AolbghkhvD+lq3NTUuiHaDPmCQSlWiudOoQsb/tiy0CE
	YjFPKnzTD8N7Po3McVDfmP0mIWmrewN4Snm7RG3DziUDQaMGCAuQ
X-Google-Smtp-Source: AGHT+IHpZmT4T8lybeJN/U2hl5jwfmp7spe4revMmxTiFh48M0jSiffKNt+oHZApVYuhlA+WSRjpUw==
X-Received: by 2002:a05:6402:440b:b0:5cf:3d11:c798 with SMTP id 4fb4d7f45d1cf-5cf8fd10554mr5278428a12.28.1731778875892;
        Sat, 16 Nov 2024 09:41:15 -0800 (PST)
Received: from ?IPV6:2a02:3100:a557:e100:45f4:697f:1405:21be? (dynamic-2a02-3100-a557-e100-45f4-697f-1405-21be.310.pool.telefonica.de. [2a02:3100:a557:e100:45f4:697f:1405:21be])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79b9e761sm2895554a12.22.2024.11.16.09.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 09:41:14 -0800 (PST)
Message-ID: <3915908d-d70b-4fbe-b80b-990d02211965@gmail.com>
Date: Sat, 16 Nov 2024 18:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] Fix 'ethtool --show-eee' during initial stage
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <403be2f6-bab1-4a63-bad4-c7eac1e572ee@gmail.com>
 <ZzdW2iB2OkbZxTgS@shell.armlinux.org.uk>
 <170a8d59-e954-4316-9b83-9b799cb60481@gmail.com>
 <Zzi7dqqZLCCVvlHq@shell.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Zzi7dqqZLCCVvlHq@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_094118_409666_29F565A5 
X-CRM114-Status: GOOD (  32.69  )
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

On 16.11.2024 16:34, Russell King (Oracle) wrote:
> On Fri, Nov 15, 2024 at 09:35:25PM +0100, Heiner Kallweit wrote:
>> On 15.11.2024 15:12, Russell King (Oracle) wrote:
>>> On Fri, Nov 15, 2024 at 02:41:54PM +0100, Heiner Kallweit wrote:
>>>> On 15.11.2024 12:11, Choong Yong Liang wrote:
>>>>> From: Choong Yong Liang <yong.liang.choong@intel.com>
>>>>>
>>>>> When the MAC boots up with a Marvell PHY and phy_support_eee() is implemented,
>>>>> the 'ethtool --show-eee' command shows that EEE is enabled, but in actuality,
>>>>> the driver side is disabled. If we try to enable EEE through
>>>>> 'ethtool --set-eee' for a Marvell PHY, nothing happens because the eee_cfg
>>>>> matches the setting required to enable EEE in ethnl_set_eee().
>>>>>
>>>>> This patch series will remove phydev->eee_enabled and replace it with
>>>>> eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(), it
>>>>> will follow the master configuration to have software and hardware in sync,
>>>>> allowing 'ethtool --show-eee' to display the correct value during the
>>>>> initial stage.
>>>>>
>>>>> v2 changes:
>>>>>  - Implement the prototype suggested by Russell
>>>>>  - Check EEE before calling phy_support_eee()
>>>>>
>>>>> Thanks to Russell for the proposed prototype in [1].
>>>>>
>>>>> Reference:
>>>>> [1] https://patchwork.kernel.org/comment/26121323/
>>>>>
>>>>> Choong Yong Liang (2):
>>>>>   net: phy: replace phydev->eee_enabled with eee_cfg.eee_enabled
>>>>>   net: stmmac: set initial EEE policy configuration
>>>>>
>>>>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 +++
>>>>>  drivers/net/phy/phy-c45.c                         | 11 +++++------
>>>>>  drivers/net/phy/phy_device.c                      |  6 +++---
>>>>>  include/linux/phy.h                               |  5 ++---
>>>>>  4 files changed, 13 insertions(+), 12 deletions(-)
>>>>>
>>>>
>>>> Russell submitted the proposed patch already:
>>>> https://patchwork.kernel.org/project/netdevbpf/patch/E1tBXAF-00341F-EQ@rmk-PC.armlinux.org.uk/
>>>> So there's no need for your patch 1.
>>>
>>> Patch 1 is an updated version of that patch, minus my authorship and of
>>> course no sign-off. I've already marked this series as requiring changes
>>> in patchwork (hopefully, if I did it correctly.)
>>>
>>
>> The updated version adds an argument to genphy_c45_an_config_eee_aneg(),
>> and I wonder whether we can do better, as this results in several calls
>> with the same argument. The following is an alternative, to be applied
>> on top of your original patch. I don't have a clear preference, though.
>>
>> ---
>>  drivers/net/phy/phy.c | 25 +++++++++++++++----------
>>  1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
>> index 8876f3673..22c9bbebb 100644
>> --- a/drivers/net/phy/phy.c
>> +++ b/drivers/net/phy/phy.c
>> @@ -1682,11 +1682,10 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
>>   * configuration.
>>   */
>>  static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
>> -				      struct ethtool_keee *data)
>> +				      struct ethtool_keee *old_cfg)
>>  {
>> -	if (phydev->eee_cfg.tx_lpi_enabled != data->tx_lpi_enabled ||
>> -	    phydev->eee_cfg.tx_lpi_timer != data->tx_lpi_timer) {
>> -		eee_to_eeecfg(&phydev->eee_cfg, data);
>> +	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
>> +	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {
>>  		phydev->enable_tx_lpi = eeecfg_mac_can_tx_lpi(&phydev->eee_cfg);
>>  		if (phydev->link) {
>>  			phydev->link = false;
>> @@ -1706,21 +1705,27 @@ static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
>>   */
>>  int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data)
>>  {
>> +	struct eee_config old_cfg;
>>  	int ret;
>>  
>>  	if (!phydev->drv)
>>  		return -EIO;
>>  
>> +	old_cfg = phydev->eee_cfg;
>> +	eee_to_eeecfg(&phydev->eee_cfg, data);
>> +
> 
> Hmm, don't we want to do this under phydev->lock, because network
> drivers and phylib may be reading from phydev->eee_cfg? If we
> update it outside the lock, and then revert, there's a chance that
> the phylib state machine / network driver may see the changes
> which then get reverted on failure, potentially leading to
> inconsistent state.
> 

Good point, then the patch would look like this.
BTW: Saw that Jakub applied your patch already.

---
 drivers/net/phy/phy.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 8876f3673..7f6594a66 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1682,11 +1682,10 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
  * configuration.
  */
 static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
-				      struct ethtool_keee *data)
+				      struct ethtool_keee *old_cfg)
 {
-	if (phydev->eee_cfg.tx_lpi_enabled != data->tx_lpi_enabled ||
-	    phydev->eee_cfg.tx_lpi_timer != data->tx_lpi_timer) {
-		eee_to_eeecfg(&phydev->eee_cfg, data);
+	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
+	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {
 		phydev->enable_tx_lpi = eeecfg_mac_can_tx_lpi(&phydev->eee_cfg);
 		if (phydev->link) {
 			phydev->link = false;
@@ -1706,18 +1705,23 @@ static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
  */
 int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data)
 {
+	struct eee_config old_cfg;
 	int ret;
 
 	if (!phydev->drv)
 		return -EIO;
 
 	mutex_lock(&phydev->lock);
+
+	old_cfg = phydev->eee_cfg;
+	eee_to_eeecfg(&phydev->eee_cfg, data);
+
 	ret = genphy_c45_ethtool_set_eee(phydev, data);
-	if (ret >= 0) {
-		if (ret == 0)
-			phy_ethtool_set_eee_noneg(phydev, data);
-		eee_to_eeecfg(&phydev->eee_cfg, data);
-	}
+	if (ret == 0)
+		phy_ethtool_set_eee_noneg(phydev, data);
+	else if (ret < 0)
+		phydev->eee_cfg = old_cfg;
+
 	mutex_unlock(&phydev->lock);
 
 	return ret < 0 ? ret : 0;
-- 
2.47.0



